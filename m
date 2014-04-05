From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 15:25:26 +0200
Subject: [Buildroot] [PATCH v4 05/37] flex: Version bump 2.5.39
In-Reply-To: <1396551692-12371-6-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
 <1396551692-12371-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140405152526.0cb4b894@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  3 Apr 2014 21:01:00 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/flex/flex-prog-ar.patch |   11 -----------
>  package/flex/flex.mk            |    2 +-
>  2 files changed, 1 insertion(+), 12 deletions(-)
>  delete mode 100644 package/flex/flex-prog-ar.patch

After applying this patch, host-thrift and ipsec-tools started to fail
building, due to an undefined reference to yylex. Since no simple
solution has been found, I've for now reverted your flex bump patch.

Can you have a look at the host-thrift and ipsec-tools problems?

See:

 http://autobuild.buildroot.org/results/759/7590122fd85b644ae0886a127005188d1f882bef/
 http://autobuild.buildroot.org/results/238/238296556663d52015beb43df97106f6e164ce55/

Regarding host-thrift, it might be worth having a look at:

 https://issues.apache.org/jira/browse/THRIFT-2386

Regarding ipsec-tools, it might be worth having a look at:

 https://www.mail-archive.com/openembedded-devel at lists.openembedded.org/msg35108.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
