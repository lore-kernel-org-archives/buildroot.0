From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Wed, 19 Sep 2012 15:36:58 -0500
Subject: [Buildroot] eaccelerator
In-Reply-To: <20120919221012.3646aa7b@skate>
References: <CAE9DZURE9s7eH_N2vhv1wK73Pip9wAVDmYtbU8Ynxn_3XpGpdQ@mail.gmail.com>
 <20120919221012.3646aa7b@skate>
Message-ID: <CAE9DZUQFsysouX9sNvJj9qLRqJQB6-goVOSezxjNc2e7a_cG4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.  You are sure right.  I figured this out earlier today.
 I have a .mk file for it which I am happy to share with anyone who
cares.  How dost one go about sharing build recipes?  I realize this
one may not be one that you want to include in the general buildroot
distribution.

On Wed, Sep 19, 2012 at 3:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Dallas Clement,
>
> On Wed, 19 Sep 2012 10:34:51 -0500, Dallas Clement wrote:
>
>> Can any of you provide guidance on the proper way to build a PHP
>> extension such as eaccelerator?  Should I create its own .mk or should
>> I modify the php.mk to extract into $(PHP_DIR)/ext and make all
>> together?  I have examined the eaccelerator tar ball contents and
>> there is no configure script present, so I am assuming the intent is
>> for it to be built with PHP.  Would appreciate any tips you might
>> have.
>
> The compilation instructions are detailed in
> https://github.com/eaccelerator/eaccelerator/blob/master/README.
> Apparently, you need to call phpize (which comes with PHP, but I don't
> know if we build it for the host at the moment, I don't think so), it
> probably generates a configure script, that you execute, and then you
> can build the extension.
>
> For sure, this extension needs to be a separate package from the php
> package.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
