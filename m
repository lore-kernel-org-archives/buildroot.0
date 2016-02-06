From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:19:12 +0100
Subject: [Buildroot] [PATCH v2] package/oprofile: fix musl build
In-Reply-To: <1454709026-13262-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454709026-13262-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160206211912.2518e9ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  5 Feb 2016 22:50:26 +0100, Bernd Kuhls wrote:
> The build error has not yet been found by the autobuilders:
> 
> operf.cpp: In function ?int __delete_old_previous_sample_data(const char*, const stat*, int, FTW*)?:
> operf.cpp:862:10: error: ?FTW_STOP? was not declared in this scope
>    return FTW_STOP;
>           ^
> operf.cpp:864:10: error: ?FTW_CONTINUE? was not declared in this scope
>    return FTW_CONTINUE;
>           ^
> operf.cpp: In function ?void convert_sample_data()?:
> operf.cpp:899:41: error: ?FTW_ACTIONRETVAL? was not declared in this scope
>                  int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added patch comment, removed unneeded patch for libop/op_events.c.
>     (Arnout)

Applied, thanks. Please don't forget to submit the patch upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
