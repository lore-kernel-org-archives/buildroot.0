From: Marc Egli <marc.egli@hsr.ch>
Date: Wed, 2 Dec 2009 19:20:08 +0100
Subject: [Buildroot] [PATCH] Adding openbox to buildroot
In-Reply-To: <4d28d4b50912020911h52ef1e70j88e8c5b592fc66f@mail.gmail.com>
References: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
	<4d28d4b50912020911h52ef1e70j88e8c5b592fc66f@mail.gmail.com>
Message-ID: <1CB99035-2FC1-42B4-B73D-02CAF7A55020@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

good question
these are the Dependencies written on the openbox homepage:
	? C compiler (such as GCC)
	? Libc library and headers (development package)
	? Xlib library and headers (development package)
	? Glib-2 library and headers (development package)
	? LibXML-2 library and headers (development package)
	? Pango library and headers (development package)
	? Startup-notification library and headers (development package) - optional but recommended
	? XCursor library and headers (development package) - optional but recommended
	? Pkg-config
i think c compiler libc and pkg config are always here if you build buildroot.
so i need the name of xlib i have to put into OPENBOX_DEPENDENCIES,
i'll also add those 2 optional dependencies with an if to add it if they are present.
i hope to get back with a better version soon, and any hint's are welcome
Am 02.12.2009 um 18:11 schrieb Lionel Landwerlin:

> On Wed, Dec 2, 2009 at 6:02 PM, Marc Egli <marc.egli@hsr.ch> wrote:
>> --- /dev/null
>> +++ b/package/openbox/openbox.mk
>> @@ -0,0 +1,16 @@
>> +#############################################################
>> +#
>> +# openbox
>> +#
>> +#############################################################
>> +
>> +OPENBOX_VERSION = 3.4.7.2
>> +OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.gz
>> +OPENBOX_SITE = http://icculus.org/openbox/releases
>> +OPENBOX_DEPENDENCIES = libglib2 pango libxml2
> 
> No x11 dependencies ?
> 
>> +#OPENBOX_LIBTOOL_PATCH=NO
>> +OPENBOX_INSTALL_STAGING=YES
>> +OPENBOX_INSTALL_TARGET=YES
>> +
>> +$(eval $(call AUTOTARGETS,package,openbox))
>> +

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091202/b22db843/attachment-0001.htm>
