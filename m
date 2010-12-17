From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 17 Dec 2010 10:44:58 +0800
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <1292509157.6496.27.camel@dubciaranr0.verifone.com>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<1292509157.6496.27.camel@dubciaranr0.verifone.com>
Message-ID: <AANLkTi=01SABHNM+ycGxtNEpX3xK8E9bN+vRqV_7_CUN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 16, 2010 at 10:19 PM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
> Hello Sonic,
>
> I've done a bit of work in this area, but it's now so outdated (in
> before Maxime's changes, although vaguely based on the same approach)
> that the patches will not apply to the current HEAD. ?I will certainly
> share these if anyone's interested. ?They'd probably apply to 2010.08.
>
> I have a few observations and questions based on the problems I
> encountered.
>
> Ar D?ar, 2010-12-16 ag 17:49 +0800, scr?obh Sonic Zhang:
>> This patch adds an option BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT to checkout the
>> source with version control information. This option is disabled by default.
>>
>
> What if you only want to have working copies of some of the
> repositories, not all?
>

This option only controls if the revision database is fetched. You can
indicate working copy version or URL in the package's config file.
Fetching revision database for all SVN/GIT packages is OK.


>> + ? ? if [ "$(BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT)" = "y" ] ; then \
>> + ? ? ? ? ? ? GITCMD="$(GIT) checkout -b $($(PKG)_BRANCH) $($(PKG)_DL_VERSION)" ; \
>> + ? ? ? ? ? ? TARCMD="$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/" ; \
>
> Where does $($(PKG)_BRANCH) get its value?
>

The package's Config.in should include this option if it points to a
GIT repository.

>
> An finally, when you make a change in your repository working copy, how
> does this change get into $(BUILD_DIR) so it's part of the build?
>

By now, you have to either run "svn update" and "git pull/checkout"
manually under output/build/package_name/ or make clean and remove the
tarball under download folder.

Sonic

>
> As I say, I have found a way to do these but it's not elegant and will
> probably not be suitable for inclusion in mainline without serious
> restructuring.
>
>
