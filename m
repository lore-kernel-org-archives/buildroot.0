From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 22:47:41 +0100
Subject: [Buildroot] [PATCH] package/upmpdcli: add upstream patch to fix
 musl build issue
In-Reply-To: <20190122191827.32742-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 22 Jan 2019 20:18:27 +0100")
References: <20190122191827.32742-1-joerg.krause@embedded.rocks>
Message-ID: <87lg3cmkjm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > upmpdcli 1.4.0 uses both the `uint64_t` and `u_int64_t` type. `uintN_t` is
 > standard C99 type available in `<stdint.h>`, whereas `u_intN_t` is defined in
 > `<sys/types.h>`.

 > Because of the missing include of `<sys/types.h>` building upmpdcli breaks now
 > when building with the musl C library, which is very strict:

 > ```
 > src/mediaserver/cdplugins/netfetch.h:71:5: error: ?u_int64_t? does not name a type
 >      u_int64_t datacount() {
 > ```

 > Add a patch from upstream which fixes the issue by replacing `u_int64_t`
 > with `uint64_t`.

 > Fixes:
 > http://autobuild.buildroot.net/results/f3082d2fdda8d73dbd9d3b65a08d844934066ef7

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
