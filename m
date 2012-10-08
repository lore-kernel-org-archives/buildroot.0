From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 8 Oct 2012 18:56:09 +0200
Subject: [Buildroot] [PATCH v9 02/10] perl: new package
In-Reply-To: <20121008134900.403178cf@skate>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-2-git-send-email-francois.perrad@gadz.org>
 <20121008113433.4b4bcc1b@skate>
 <CAB0FRss5vs6xDU2ggQAZYo7Tff5JSBMw519ta-x-4FRE6hxefg@mail.gmail.com>
 <20121008134900.403178cf@skate>
Message-ID: <CAB0FRsuzTXvxs-t=sVTws2u=aK2VssgW5OA-w1rh26=3Ac1okg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>
> On Mon, 8 Oct 2012 13:41:16 +0200, Fran?ois Perrad wrote:
>
>> > In my target, I have about 2 MB of C header files in
>> > usr/lib/perl5/5.16.1/linux-gnueabihf/CORE. I suspect they are not
>> > really useful, right?
>>
>> No, there are required for building XS modules (with cpanminus for example).
>
> Yes, but you're not building those XS modules on the target. So keep
> the headers only in $(STAGING_DIR).
>

a BR user could choose between 2 methods for installing Perl :
- a full install supplied by the script `installperl` from the Perl tarball
- a custom install which reproduce the behavior of the BR package of microperl,
where the user explicitily defines each module/file to install

In my sense, when a user chooses the full install, he must also use
the post-build script which removes its useless files,
like CORE/*.h or the Unicode support.

Fran?ois

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
