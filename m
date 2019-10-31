From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 23:01:46 +0100
Subject: [Buildroot] [PATCH] package/openresolv: bump to version 3.9.2
In-Reply-To: <CABhNV21YvkEH5k-t7zQD2qi8uJxP6BOxJyAdPiX4i==jOcLuhg@mail.gmail.com>
 ("Einar =?utf-8?Q?J=C3=B3n=22's?= message of "Thu, 31 Oct 2019 20:48:03
 +0100")
References: <1571124033-15304-1-git-send-email-tolvupostur@gmail.com>
 <8736fb6co8.fsf@dell.be.48ers.dk>
 <CABhNV21YvkEH5k-t7zQD2qi8uJxP6BOxJyAdPiX4i==jOcLuhg@mail.gmail.com>
Message-ID: <87bltw4lrp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Einar" == Einar J?n <tolvupostur@gmail.com> writes:

Hi,

 >> What does this mean exactly? I take it you refer to the '# ethX' we add
 >> to /etc/resolv.conf so we can remove the lines once the interface is
 >> again down.

 > Exactly those, and similar lines (if any) in head/tail files.

Ok, does the logic in /usr/share/udhcpc/default.script to remove name
servers again when an interface is brought down then still work?


 >> Did older openresolv versions not work correctly with this?

 > Openresolv 3.9.0 and older turned "nameserver 1.2.3.4 # ethX" to
 > nameserver 1.2.3.4
 > nameserver  #
 > nameserver ethX
 > See this email (and the rest of that thread):
 > https://roy.marples.name/archives/openresolv-discuss/0000041.html

Thanks.

 >> E.G. is this
 >> something that should be backported to 2019.02.x / 2019.08.x

 > If this was broken until July this year I don't think many people are using
 > a
 > combo of udhcpc+openresolv, so I doubt that backporting is very urgent.
 > We need it because we have to use NetworkManager for the modem, but
 > we don't want NetworkManager for ethX and the rest of the system.
 > That's probably a pretty unique use-case.

I indeed guess not.

Thanks.

-- 
Bye, Peter Korsgaard
