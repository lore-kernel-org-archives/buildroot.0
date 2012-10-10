From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 10 Oct 2012 16:41:40 +0200
Subject: [Buildroot] [PATCH v9 02/10] perl: new package
In-Reply-To: <20121008134900.403178cf@skate>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-2-git-send-email-francois.perrad@gadz.org>
 <20121008113433.4b4bcc1b@skate>
 <CAB0FRss5vs6xDU2ggQAZYo7Tff5JSBMw519ta-x-4FRE6hxefg@mail.gmail.com>
 <20121008134900.403178cf@skate>
Message-ID: <CAB0FRss_BKG3=oQAwJijXMNNREaP_neMgNDQk0_3hruhNH8o+A@mail.gmail.com>
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

After a refactoring of cpanminus.mk, the headers in $(TARGET_DIR)
could be removed.

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
