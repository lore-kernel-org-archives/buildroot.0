From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Fri, 5 May 2017 12:33:58 +0000
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
In-Reply-To: <32863807-7cf4-75fc-1dd3-0e6f6517986e@gmail.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
 <f24453b3-9fc6-1a1e-4e01-071da345bbdb@gmail.com>
 <1493881807.2302.3.camel@spectralink.com>
 <32863807-7cf4-75fc-1dd3-0e6f6517986e@gmail.com>
Message-ID: <1493987636.2742.3.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-05-04 at 23:34 +0200, Romain Naour wrote:
> Hi Stefan, all,
> 
> Le 04/05/2017 ? 09:10, S?rensen, Stefan a ?crit :
> > On Sun, 2017-04-30 at 15:36 +0200, Romain Naour wrote:
> > 
> > > +ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
> > > > +define CRACKLIB_REMOVE_TOOLS
> > > > +	rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
> > > 
> > > Maybe this part can be done in a post install script instead ?
> > 
> > Post install script? I can't find any reference to what that is.
> 
> Sorry, I meant post build scripts, see BR2_ROOTFS_POST_BUILD_SCRIPT
> option.

The tools mostly for creating password dictionaries. I guess that these
will rarely be used on the target, so to me it seems better to remove
them in the package, rather than in post build scripts for everybody
that does not need them.

Stefan
