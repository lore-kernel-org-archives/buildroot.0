From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:15:20 +0100
Subject: [Buildroot] [PATCH] netatalk: fix 64-bit build
In-Reply-To: <1355780891-26657-1-git-send-email-arnout@mind.be>
References: <1355780891-26657-1-git-send-email-arnout@mind.be>
Message-ID: <50CF9978.9000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 22:48, Arnout Vandecappelle (Essensium/Mind) wrote:
> The configure script sets LD_LIBRARY_PATH to the staging directory,
> which makes the `ls` that is called in one of the tests fail. Fix by
> not setting LD_LIBRARY_PATH when cross-compiling.
>
> The patch has been sent upstream.
>
> Also remove the BDB_LIB variable: it isn't used.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>

  Actually, this probably has nothing to do with 64-bit, but rather with 
host==target...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
