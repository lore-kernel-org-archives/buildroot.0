From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 09:51:29 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <CAOcYpt2UguFUJAufrM8A5O3NwS6u+ogGYkSYf+=QO+tL5TbJjQ@mail.gmail.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
 <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
 <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
 <CAOcYpt3FL4sTBF-Edk4ShGX2vE2wGYX4gp7jHmsfDMxxA=03DA@mail.gmail.com>
 <20151021212450.1c6fc5b4@free-electrons.com> <5627EEE3.3010302@mind.be>
 <20151021221804.483ac95d@free-electrons.com> <5627F815.6090701@mind.be>
 <CAOcYpt2UguFUJAufrM8A5O3NwS6u+ogGYkSYf+=QO+tL5TbJjQ@mail.gmail.com>
Message-ID: <56289581.5000604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-15 08:53, David Kosir wrote:
>>> However, there is still the question: why eudev in /, and not any other
>>> package that other users may find important to have in / ? Where do we
>>> put the boundary ?
>>
>>  Because eudev is already installed mostly in / - as I said, even if libudev.so
>> is installed in /usr/lib, there's still a symlink created to point to it from
>> /lib. Same for udevadm: installed in /usr/bin but a symlink is created from
>> /bin. Basically, it's eudev itself that decides it should be in / in addition to
>> /usr.
> 
> Exactly, you can check in src/libudevMakefile, install-exec-hook.
> 
>>  This patch looks good, but was not sent properly and did not appear in our
>> patch tracking system. Can you resubmit properly, using git send-email?
> 
> I will try it. I just copy-pasted in into gmail as send-mail was
> complaining about something regarding ssl. I guess that is why it
> didn't work.

'git help send-email' gives a very good explanation about how to configure gmail.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
