From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 18 Apr 2016 10:07:58 -0700
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <20160418162528.GA5827@asimov.austin.ibm.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
Message-ID: <CAJJ6jxuPyLjaZOWNJTeEebrEsyUqT81gwgoZcUDTH9A6yPX++w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

On Mon, Apr 18, 2016 at 9:25 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Since machines are often developed under confidentiality we are
> attempting to create a "second level" BR2_EXTERNAL.  This is the
> openpower/custom tree and where the 'custom' came from in this patchset.
> Our intention with that is to give developers a location to place
> machines, packages, and patches currently under NDAs while they are
> being developed.  By having them in a separate tree, the developers can
> continuously rebase against our master branch and have less of a issue
> with merge conflicts, since we promise not to place anything in the
> custom tree ourselves.
>
> We already utilize BR2_GLOBAL_PATCH_DIR and include custom/*.mk to allow
> patches and additional packages to be placed under the custom tree.  The
> only piece that is missing is the defconfigs; hence this first attempt
> at a patch.  We would like to be able to do the following:
>

Couldn't you get everything you want by allowing a custom user "fred"
to create a symlink in your ...configs/ directory to his own custom
config like:

ln -s ../custom/configs/freds_defconfig

Then all the buildroot infrastructure will work as designed, you can
have your standard BR2_EXTERNAL tree and "fred" can have his own
custom tree. Since you won't check in the symlink and only fred's
development will use it, no git conflicts....?

Regards, Steve
