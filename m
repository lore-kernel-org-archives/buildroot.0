From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:12:58 +0100
Subject: [Buildroot] [PATCH 09/14] genrandconfig: fix code style
In-Reply-To: <1516581882-30582-10-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1516581882-30582-10-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180129231258.58dd6879@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Jan 2018 22:44:37 -0200, Ricardo Martincoski wrote:
> Fix these warnings:
> E201 whitespace after '['
> E202 whitespace before ']'
> 
> Ignore these warnings:
> E501 line too long (138 > 132 characters)
>  -> flake8 has options to ignore all warnings in a single file, to  
>  ignore a given warning for all files, and to ignore a given warning for
>  a line. Unfortunately it does not have an option to ignore a given
>  warning for a single file, so add the magic comments to all lines with
>  the warning. It makes the lines even longer, but keeps the check for
>  the rest of the file and stops generating warning for them.
>  Alternative solutions would be to isolate the common part of the
>  strings as a variable and concatenate on the fly the strings (using a
>  bit more processing):
>    ...="' + COMMON_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in ...

Yes, please do this. Or perhaps we could use some regexp, because we
really don't care about the full URL, but just about the tarball name,
no?

But I believe all those warning exceptions are really annoying to have.
I'd really prefer a smarter solution here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
