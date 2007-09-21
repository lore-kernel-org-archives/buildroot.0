From: Leonid <Leonid@a-k-a.net>
Date: Fri, 21 Sep 2007 00:22:33 -0700
Subject: [Buildroot] Buildroot and perforce.
Message-ID: <406A31B117F2734987636D6CCC93EE3CB05B69@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All:

 

I have asked questions below but did it on linux-arm forum which was not
exactly the place though I got answer from Tom. I would appreciate other
feedbacks from buildroot experts.

 

On Thursday, September 20, 2007 7:29 PM Tom wrote:

 

> Leonid wrote:

> > I am new to buildroot and I'm trying to use it to create filesystem
for

> > my at91rm9200 based board. I downloaded
buildroot-20070116-RC2.tar.bz2

> > from at91 web site (latest relevant image I could find) and have
built

> > filesystem images. 

> > 

> > It basically works, though I couldn't build some packages.

> > 

> > Now I want to put my filesystem to version manager (we use perforce,
but

> > this is not important). I don't want to put buildroot itself since
it

> > doesn't have all necessary files - they get downloaded from network

> > during configuration process - and I cannot risk that approach -
what if

> > some package changed or is not there?

 

> First, your request should have gone to the buildroot list, this is

not 

> an ARM/linux question. For any replies, please use this one.

> 

 

Understood, I'll subscribe there first thing in the morning. Can you
also recommend some buildroot tutorial, different from
http://buildroot.uclibc.org/buildroot.html which omits certain details? 

 

> > to find which files got changed/delete? Or I should use some

external

> > tools (diff) to compare my existing tree with the new one?

> > 

> > Certainly people dealing with such problems a lot and I'll

appreciate

> > any suggestions or framework to accomplish the task. If somebody can


> > share scripts to add/delete/modify packages in previously created by


> > buildroot filesystem that will be really nice.

> 

> You can certainly use whatever tools you want. 

 

Does it mean buildroot doesn't have intrinsic option for incremental
update?

 

> Assuming your buildroot

> is installed in [br] and uses the folder [br]/dl for download and your

 

> managed to build everything as you want it into your staging dir [sd],

 

 

The staging directory is where toolchain will be installed, right?

 

> you would add to your revision control after a successful build:

> 

> [br]/.config

> [br]/dl

> [br]/docs

> [br]/package

> [br]/target

> [br]/toolchain

> 

That doesn't include packages' source files but only their tarballs,
right? In general, from example foo.mk file which is presented online I
can conclude that only standard way of adding packages is the following:

- download package from FOO_SITE.

- save tarball in dl directory.

- unpack and build.

 

But I may have my package in the form of local source files which I
don't want to pack since I'm modifying them. Same goes for standard
packages I wish to patch/hack. While I can write makefile for such case
myself, I would like to see standard buildroot's way to include such an
application if possible.

 

Now looks like I need to unpack tarball, modify sources and pack it
back.

 

> + any config files your builroot uses which are easiest kept in a

> sperate folder, [cfg].

> 

 

What files do you mean? Pre-configured stuff for certain boards?

 

> 

> On a checkout, just make sure that buildroot really uses all the right

 

> config files, and buildroot will produce the corresponding output dirs

 

> [br]/build_arm_ as and [sd] as you had it before. (This is also true

for 

> any changes to the template filesystem located in

> [br]/target.../..._skeleton.)

> 

 

So, ...skeleton plays a role of "static" files which will be simply

copied into filesystem tree, right?

 

> You can certainly also put your [sd] into revision control; just keep

in 

> mind that buildroot will try to write there whenever executed.

> 

 

Staging dir will hold toolchain itself (binaries/libraries) as far as I

know. Normally people won't modify toolchain. I even don't want

buildroot will create toolchain each and every time - is there an

"official" way to disable toolchain creation?

 

I'd rather save on perforce BUILD_DIR (minus object/binary files) but it

will be rewritten each time anyway...

 

Thanks a lot,

 

Leonid.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070921/0b8fc9a4/attachment-0001.htm 
