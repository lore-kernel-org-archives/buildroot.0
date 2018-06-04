From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 4 Jun 2018 07:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: selects openssl
In-Reply-To: <20180604065939.326bf279@windsurf>
References: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
 <20180604065939.326bf279@windsurf>
Message-ID: <CAPi7W82tVic4+M663rJ8V-rTQh-=MhMPdgBgmWgr5nzcJvcO1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-04 6:59 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sun,  3 Jun 2018 21:31:26 +0200, Fabrice Fontaine wrote:
> > php-amqp needs a rabbitmq-c with openssl support:
> > https://github.com/pdezwart/php-amqp/issues/310
>
> We've had php-amqp since October 2016 and the last version bump is from
> May 2017, i.e a year ago. What has changed that makes php-amqp now
> require OpenSSL support in rabbitmq-c ?
>
SSL connection supports in php-amqp was added in 1.8.0beta2:
https://github.com/pdezwart/php-amqp/commit/83defa18d958503a395e928d4669a23041014b2e
.
So it was introduced in buildroot by the bump to version 1.9.0 in May 2017.
In autobuilders, we have three errors with php-amqp:
http://autobuild.buildroot.net/?reason=php-amqp-1.9.0.
The three errors are all related to SSL and the older one is from February
2018 but I suppose that autobuilder results are deleted after some time?

>
> Is this an issue that was always occurring, but we never fixed ? Is it
> a new issue ? If so, why does it suddenly started to happen ?


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/c0364cc1/attachment.html>
