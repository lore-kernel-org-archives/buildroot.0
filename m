From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Jul 2017 16:09:06 +0200
Subject: [Buildroot] [PATCH v3 1/3] libssl: new virtual package
In-Reply-To: <CAFSsvmpk1kv=ePdvmccKGwo7BFQ16W2D-Qv=gbt=LoRPYbJJWg@mail.gmail.com>
References: <20170626162538.27101-1-aduskett@codeblue.com>
 <36fa6794-7eae-2eb7-b9e2-7a0f58a39c0b@mind.be>
 <CAFSsvmpk1kv=ePdvmccKGwo7BFQ16W2D-Qv=gbt=LoRPYbJJWg@mail.gmail.com>
Message-ID: <bc879ef2-056f-ab36-163e-fd08be1fe000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 12:16, Adam Duskett wrote:
> Hey Arnout;
> 
> Thanks for the feedback! See my comments below:
> 
> On Wed, Jul 5, 2017 at 3:50 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>  So here is the problem: if an existing config has BR2_PACKAGE_OPENSSL selected,
>> then it will silently disappear when they update Buildroot. There is no simple
>> way to resolve this, except by renaming the openssl package to something else,
>> and making sure that the virtual package is called openssl. This is how we did
>> it for libjpeg/jpegturbo: libjpeg was originally called jpeg and jpeg became the
>> virtual package.
>>
> mmm, I disagree.

 What do you disagree with? I hope you agree that existing configs that have
BR2_PACKAGE_OPENSSL selected should still have it selected after the transition,
right? Or do you disagree that it is not simple? Or do you disagree that a
rename is needed?

>  I don't think it's as insurmountable or as difficult
> as we are making it
> out to be to transition.  A quick glance: There are 157~ (current)
> packages that select openssl.

 85 that select it and 169 that use it in the .mk file.

> That's not too terrible to do a transition.
> 

[snip]
>>  I would personally prefer to keep this in package/openssl/Config.in and to add here
>>
>> source "package/openssl/Config.in"
>>
> Ok.  I was following the libjpeg/jpeg-turbo virtual package model.  If
> we go this route, would
> it be a good idea to add the respective Config.in files to libjpeg and
> jpeg-turbo as well?

 libjpeg and jpeg-turbo don't have any sub-options so it's not relevant there.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
