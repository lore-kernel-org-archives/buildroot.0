From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 09:12:35 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/softether: Fix iconv-related
 compile error
In-Reply-To: <874mplg9bz.fsf@dell.be.48ers.dk>
References: <1426408159-24817-1-git-send-email-bernd.kuhls@t-online.de>
 <20150315125324.39a11265@free-electrons.com>
 <874mplg9bz.fsf@dell.be.48ers.dk>
Message-ID: <20150316091235.7c77634c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 15 Mar 2015 23:54:56 +0100, Peter Korsgaard wrote:

>  > Indeed, the LIBS += handling is fixed by your patch, but I'm wondering
>  > why I'm not seeing the problem.
> 
> I'm not sure either. As I mentioned earlier, I am also not able to
> reproduce the issue.

Yann suggested it might be a dash vs. bash issue where bash would
accept multiple LIBS += on the command line, but not dash. But I
changed /bin/sh to point to /bin/dash on my system, and I still
couldn't reproduce the problem.

Still the problem is real as it appears on the autobuilders, but it'd
be great to understand fully what's going on.

I'll try to run Bernd's minimal failing config in one of the
autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
