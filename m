From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:28:32 +0100
Subject: [Buildroot] [PATCH v2] evtest: disable documentation
In-Reply-To: <1424621697-22309-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424621697-22309-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150222222832.46d350ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sun, 22 Feb 2015 16:14:57 +0000, Vicente Olivert Riera wrote:
> evtest uses asciidoc to generate documentation, but /usr/bin/asciidoc
> will try to use buildroot's host-python which doesn't have the required
> unicodedata. To avoid that, define ASCIIDOC as an empty string so the
> Makefile can't find the executable and skips the documentation
> generation.  This is the same solution used in the evemu package.
> Otherwise it will fail with this message:
> 
> make[1]: Entering directory `/br/output/build/evtest-1.32'
> /usr/bin/make  all-am
> make[2]: Entering directory `/br/output/build/evtest-1.32'
>   File "/usr/bin/asciidoc", line 95
>     except KeyError, k: return None
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
