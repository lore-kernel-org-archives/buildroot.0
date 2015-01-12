From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 12 Jan 2015 09:17:29 +0100 (CET)
Subject: [Buildroot] Repository information during build
In-Reply-To: <54B2F688.9010406@gmail.com>
Message-ID: <754188306.30166927.1421050649875.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hey Thomas





----- Mail original -----
> Hi Bernd,
> thanks for the reply.
> 
> > TVHEADEND_VERSION = c051d0bda5b69ce61e64a97fd4a41db899dcfb53
> > TVHEADEND_SITE=$(call
> > github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
> 
> In your example the version is already in the makefile. The source
>  is
> retrieved by its SHA1.
> What I wanted to do is to let the makefile always check out the
> master
> branch. I don't like to update my buildroot makefiles if the master
> branch changes its HEAD revision.
> 

This breaks one of buildroot's main selling point : reproducible builds...

The reason why BR checksout a specific ID instead of a branch name is to
make sure that two builds are exactly the same. Yes you have to manually
update your .mk when a new version is released, but you have reproducible
builds which are critical to know what you have on your plateform.

Now I understand that when you want to develop, being able to checkout a
branch is very tempting, but branches are moving targets, BR just checks
if it already has downloaded the package, and doesn't do it again if it 
finds it around. (in other word, there is no infrastructure to check 
"moving targets" like branch names)

That would be an interesting feature to add (I'm not sure how, though) but
any package that you want to upstream will have to target a specific
tag/id, because BR upstream should be reproducible...


> ... maybe I have to rethink the integration strategy. But even if, I
> really would like to have this feature....
> 
> Best regards
> Thomas
> 
> 
> 
> On 01/11/2015 07:05 PM, Bernd Kuhls wrote:
> > Thomas Ruschival <t.ruschival@gmail.com> wrote
> > in
> > news:CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ at mail.gmail.com:
> > 
> >> I.e. how do I find out the revision of the "master" branch
> >> Buildroot used
> >> to create the tarball?
> > 
> > Hi,
> > 
> > an example:
> > http://git.buildroot.net/buildroot/tree/package/tvheadend/tvheadend.mk
> > 
> > You are looking for $(TVHEADEND_VERSION).
> > 
> > Regards, Bernd
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
