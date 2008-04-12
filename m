From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 12 Apr 2008 19:25:10 +1000
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207839098.6817.444.camel@nigel-x60>
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
	<8763upaice.fsf@macbook.be.48ers.dk>
	<1207839098.6817.444.camel@nigel-x60>
Message-ID: <20080412092510.GB15915@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 10, 2008 at 02:51:38PM +0000, Nigel Kukard wrote:
> 
> >  Nigel> What is going on in libxml2.mk?  I need to add libxml as one of the
> >  Nigel> deps  :)
> > 
> > That's the new autotools autotargets stuff. I don't know much about
> > it, but take a look at package/Makefile.autotools.in.
> > 
> > The problem is going to be that the automatic rules uses
> > $BUILD_DIR/package-<version>/.stamp_staging_installed, so you'll have
> > to hardcode the version and it'll break when the version is bumped.
> > 
> > Maybe we should rather add a .stamp_<package>_<whatever> directly in
> > BUILD_DIR?
> 
> At present I nuke .root and root  in my build_xxx/uclibc dir and do a
> make and everything is installed again.  Maybe its just my luck ...
> 
> If we add .stamp_xxx to the build dir ... I guess my luck will run
> out ;)

Yep, that really sucks. Please, depend on files in the target dir rather
than on stamp files elsewhere. Unless you use external toolchain I think
nuking the root is already unsafe :-(


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
