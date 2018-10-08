From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:47:10 +0200
Subject: [Buildroot] [PATCH] utils/get-developers: add -e flag to only
 list email addresses for git send-email
In-Reply-To: <20181008074333.1582-1-peter@korsgaard.com>
References: <20181008074333.1582-1-peter@korsgaard.com>
Message-ID: <20181008174710.7ec55a35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 09:43:33 +0200, Peter Korsgaard wrote:
> When called with a list of patches, get-developers prints the entire git
> send-email invocation line:
> 
> ./utils/get-developers 0001-git-security-bump-to-version-2.16.5.patch
> git send-email --to buildroot at buildroot.org --cc "Matt Weber <matthew.weber@rockwellcollins.com>"
> 
> This may be handy when creating an entire patch series and editing a cover
> letter, but it does mean that this has to be explicitly executed and
> get-developers cannot be used directly by the --cc-cmd option of git
> send-email to automatically CC affected developers.
> 
> So add an -e flag to only let get-developers print the email addresses of
> the affected developers in the one-email-per-line format expected by git
> send-email, similar to how get_maintainer.pl works in the Linux kernel.
> 
> With this and a suitable git configuration:
> 
> git config sendemail.to buildroot at buildroot.org
> git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"
> 
> You can simply do:
> 
> git send-email master
> 
> To automatically mail the buildroot list and CC affected developers on
> patches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  utils/get-developers | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
