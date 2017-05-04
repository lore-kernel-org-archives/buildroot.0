From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Thu, 4 May 2017 07:10:17 +0000
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
In-Reply-To: <f24453b3-9fc6-1a1e-4e01-071da345bbdb@gmail.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
 <f24453b3-9fc6-1a1e-4e01-071da345bbdb@gmail.com>
Message-ID: <1493881807.2302.3.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2017-04-30 at 15:36 +0200, Romain Naour wrote:

> +ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
> > +define CRACKLIB_REMOVE_TOOLS
> > +	rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
> 
> Maybe this part can be done in a post install script instead ?

Post install script? I can't find any reference to what that is.

> > +	rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
> 
> Why do you remove cracklib-small binary ?

This is not a binary, but rather the source for the small dictionary.
It is not needed on the target.


Stefan
