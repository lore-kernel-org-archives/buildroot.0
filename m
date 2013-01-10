From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jan 2013 11:22:46 +0100
Subject: [Buildroot] [PATCH 1/2] added infozip package
In-Reply-To: <1357812808-3317-1-git-send-email-jp@jp-embedded.com>
References: <1357812808-3317-1-git-send-email-jp@jp-embedded.com>
Message-ID: <20130110112246.74db4cc0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pedersen,

On Thu, 10 Jan 2013 11:13:27 +0100, Jan Pedersen wrote:
> 
> Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
> ---
>  package/Config.in          |    1 +
>  package/infozip/Config.in  |   10 ++++++++++
>  package/infozip/infozip.mk |   43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 package/infozip/Config.in
>  create mode 100644 package/infozip/infozip.mk

Thanks, but your patches 1/2 and 2/2 should be only one patch. Please
merge them together.

In order to do that, you'll have to do an interactive git rebase:

 1. Tell git to rebase the last two patches

 git rebase -i HEAD~2

 2. A text editor will open, which will show two lines

pick <some SHA1> added infozip package
pick <some SHA1> now using generic-package

Change the "pick" word on the second line to "squash", and exit your
text editor.

 3. A new text editor will open, which allows you to edit the commit
    message. Change the commit message to be:

===
infozip: new package

This commit adds a package for infozip, compression and file
packaging/archive utility.

Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
===

    And exit your text editor.

And voil?, you have only one commit combining your two changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
