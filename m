From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Sep 2014 14:56:26 +0200
Subject: [Buildroot] [PATCH] whois: Fix unmet dependencies
In-Reply-To: <1411123327-29657-1-git-send-email-jezz@sysmic.org>
References: <1411123327-29657-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140919145626.757a8078@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 19 Sep 2014 12:42:07 +0200, J?r?me Pouiller wrote:
> Fix :
>    BR2_PACKAGE_WHOIS selects BR2_PACKAGE_GETTEXT which has unmet direct dependencies (BR2_USE_WCHAR)
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/whois/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Please read
http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file,
especially section "16.2.2 Dependencies on target and toolchain
options".

You need to add a comment when adding a dependency on a toolchain
feature.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
