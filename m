From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 10 Sep 2013 20:32:32 -0500
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree
	Buildroot	customization
In-Reply-To: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas - 

Thank you so much for this patchset as it address the biggest issue that
my company currently has with buildroot and will help us become a much 
bigger
contributer to buildroot since we can move to a model that is conducive to
contributing changes back up to buildroot.

See my other comments below. I'm currently testing the patchset out and 
will
be commenting on this shortly.

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
08:15:26 AM:

> Hello,
> 
> Following the e-mail from Ryan Barnett entitled "[RFC] New feature to
> handle a custom board folder", I finally took a bit of time to
> implement how I think the support for externally stored Buildroot
> customization should be done.

After getting feedback from Arnout my idea of how this shifted towards 
the model that you've implemented here in this patchset. However, without
intimate knowledge of top-level make structure/kconfig, I didn't quite
visualize this implementation.

With  the Buildroot mailing list I did not see this patchset until this
morning so you can disregard my thoughts about my second revision of how 
to approach this problem even though I was starting to gravitate towards
this approach. However, my reasoning of why I would like to push for some
thing like this still stand.

> I really think the approach of having board-related configuration
> options within Buildroot is wrong: it is the Buildroot configuration
> as a whole that defines what the configuration of the user system is:
> a combination of a kernel, a root filesystem with various packages, a
> selection of a root filesystem image format, some system configuration
> tuning, a bootloader, etc.

I definitely agree!

> In Ryan e-mail, I believe the most important thing is the wish to
> store the board-specific details outside of the Buildroot tree. In
> fact, this is already possible: nothing prevents anyone from using
> $(TOPDIR)/../company/kernel.config as the kernel configuration file
> for example, where $(TOPDIR)/../company/ is outside of the Buildroot
> tree, and versioned in a completely different way.

Yes this is correct. The biggest challenge is differentating our company's
proprity changes with changes that we have brought in from the buildroot
comminuity as a project progresses through it's development stages. It
is definitely a change when not being able to use git.

> However, it seems like this possibility is not 'visible' enough, and
> admittedly only usable for some Buildroot configuration elements,
> while an user may also be interested in storing Buildroot package
> recipes and Buildroot deconfig files outside of the main Buildroot
> tree.

I agree because usually our changes were scattered between board/<company>
and <package/company>. This model allows for use to consolidate outside
of buildroot in one toplevel directory.

> So, this patch set adds the BR2_EXTERNAL mechanism. It is very
> lightweight, and doesn't change anything to the Buildroot overall
> logic. Basically, BR2_EXTERNAL is an environment variable that one can
> point to a directory that will contain Buildroot customizations. It is
> then usable for three things:

Agree that it is very lightweight and minimal.

Thanks Again,
-Ryan



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/2e3c6953/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/2e3c6953/attachment.gif>
