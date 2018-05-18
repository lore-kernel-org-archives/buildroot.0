From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri, 18 May 2018 17:32:17 -0300 (BRT)
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: flake8 print()
 cleanup
In-Reply-To: <1526648700-15130-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1526648700-15130-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1640465213.1400009.1526675537608.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Friday, May 18, 2018 10:05:00 AM, Matt Weber wrote:

> support/scripts/pkg-stats: flake8 print() cleanup

AFAIK flake8 doesn't warn about this yet. Maybe this is a better title:
support/scripts/pkg-stats: add parenthesis for print

Also mentioning it is related to Python 3 in the commit log would be good:
Use Python3-style "print".

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

If we want to support Python 2.6 for old distros this would also be needed:
from __future__ import print_function
But supporting old distros is important for scripts that run *during* the build
process, so I think we don't need to do this in this case.

[The commit title/message can be improved while applying;
 I assume we don't need to support Python 2.6 for this script, only for scripts
 that run during the build process.]
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Regards,
Ricardo
