From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Dec 2019 10:55:02 +0000
Subject: [Buildroot] [Bug 12196] duma package
In-Reply-To: <bug-12196-163@https.bugs.busybox.net/>
References: <bug-12196-163@https.bugs.busybox.net/>
Message-ID: <bug-12196-163-gx0ymyfmhZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

--- Comment #5 from Aleksey <ioctl@ya.ru> ---
It's on the Marvell Poncat3 SOC CPU. Program text:

#include <stdio.h>

int main()
{
        char *a;

        a = malloc(1024);
        a = realloc((void*)a, 2048);
        free(a);
        return 0;
}

-- 
You are receiving this mail because:
You are on the CC list for the bug.
