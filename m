From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 1 Oct 2015 00:16:36 +0200
Subject: [Buildroot] [PATCH] libosmesa: New package
In-Reply-To: <20150930233743.6835979e@free-electrons.com>
References: <560C50B6.3050409@dawncrow.de>
 <20150930233743.6835979e@free-electrons.com>
Message-ID: <560C5F44.8070101@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.09.2015 um 23:37 schrieb Thomas Petazzoni:
> Dear Andr? Hentschel,
> 
> On Wed, 30 Sep 2015 23:14:30 +0200, Andr? Hentschel wrote:
> 
>> diff --git a/package/libosmesa/libosmesa.hash b/package/libosmesa/libosmesa.hash
>> new file mode 100644
>> index 0000000..0501314
>> --- /dev/null
>> +++ b/package/libosmesa/libosmesa.hash
>> @@ -0,0 +1,2 @@
>> +# From http://lists.freedesktop.org/archives/mesa-announce/2015-September/000175.html
>> +sha256	e36ee5ceeadb3966fb5ce5b4cf18322dbb76a4f075558ae49c3bba94f57d58fd	mesa-10.6.8.tar.xz
>> diff --git a/package/libosmesa/libosmesa.mk b/package/libosmesa/libosmesa.mk
>> new file mode 100644
>> index 0000000..f70fd2a
>> --- /dev/null
>> +++ b/package/libosmesa/libosmesa.mk
>> @@ -0,0 +1,30 @@
>> +################################################################################
>> +#
>> +# libosmesa
>> +#
>> +################################################################################
>> +
>> +# When updating the version, please also update mesa3d
>> +LIBOSMESA_VERSION = 10.6.8
>> +LIBOSMESA_SOURCE = mesa-$(LIBOSMESA_VERSION).tar.xz
>> +LIBOSMESA_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(LIBOSMESA_VERSION)
> 
> Why are you creating a new package, instead of simply adding a new
> option to the existing mesa3d package?
> 

Hi,

I thought I keep it seperate as osmesa is totally standalone,
but looking closer at the mesa3d.mk it seems this is still possible if the comment about libgl is correct.
(We don't need a libgl for osmesa, but if libgl is only build when a DRI driver is selected it is fine)
