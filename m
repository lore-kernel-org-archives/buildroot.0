From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 08:20:00 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
 portability)
In-Reply-To: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <52E608A0.3000305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/14 15:11, Bj?rn Forsman wrote:
> 'command -v' is defined by POSIX (and is available "everywhere"),
> 'which' is not.
>
> This is improves user experience when 'which' isn't installed so that
> there won't be error messages about missing 'which'*before*  the
> Buildroot dependency check is run.
>
> Current behaviour:
>
>    $ make
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    /bin/sh: which: command not found
>    support/dependencies/check-host-tar.sh: line 5: which: command not found
>    support/dependencies/check-host-tar.sh: line 7: which: command not found
>    /home/bfo/buildroot/support/dependencies/dependencies.sh: line 56:
>    which: command not found
>
>    You must install 'which' on your build machine
>    make: *** [core-dependencies] Error 1
>
> New behaviour:
>
>    $ make
>
>    You must install 'which' on your build machine
>    make: *** [core-dependencies] Error 1
>
> Signed-off-by: Bj?rn Forsman<bjorn.forsman@gmail.com>

  There are also instances of which in manual.mk and toolchain-external.mk.

  With those removed, I wonder if it is even necessary to have which 
installed at all? Could you test that with a largish config?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
