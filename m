From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 14:51:38 +0000
Subject: [Buildroot] advice on makefile
In-Reply-To: <8763upaice.fsf@macbook.be.48ers.dk>
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
	<8763upaice.fsf@macbook.be.48ers.dk>
Message-ID: <1207839098.6817.444.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Nigel> What is going on in libxml2.mk?  I need to add libxml as one of the
>  Nigel> deps  :)
> 
> That's the new autotools autotargets stuff. I don't know much about
> it, but take a look at package/Makefile.autotools.in.
> 
> The problem is going to be that the automatic rules uses
> $BUILD_DIR/package-<version>/.stamp_staging_installed, so you'll have
> to hardcode the version and it'll break when the version is bumped.
> 
> Maybe we should rather add a .stamp_<package>_<whatever> directly in
> BUILD_DIR?

At present I nuke .root and root  in my build_xxx/uclibc dir and do a
make and everything is installed again.  Maybe its just my luck ...

If we add .stamp_xxx to the build dir ... I guess my luck will run
out ;)

I really think some kind of unification needs to be agreed apon, this
would include targets, deps ... etc. Maybe a wiki on standards,
guidelines ... etc?  from my mucking around I've seen very many ways to
do the same thing, not all the right way and most of the time the wrong
way is more commonly used.

*shrug*

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/928ae847/attachment.pgp 
