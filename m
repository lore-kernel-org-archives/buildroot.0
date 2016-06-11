From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 11 Jun 2016 19:22:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmake: with BR2_ENABLE_DEBUG
	use RelWithDebInfo
In-Reply-To: <20160611190604.020d7531@free-electrons.com>
References: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
 <20160611161913.5ad9765f@free-electrons.com>
 <CAHXCMMJrKaCxTSh1psSfDHF6_S2XtHwLA32SBbQGWs2HVGTToA@mail.gmail.com>
 <20160611190604.020d7531@free-electrons.com>
Message-ID: <CAHXCMMKAs1E4F6MCZCjtgoPp7NTY-JwMpGmK7Jn2v54MtnMjGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 11, 2016 at 7:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 11 Jun 2016 17:22:24 +0200, Samuel Martin wrote:
>
>> By default CMake sets the CFLAGS like this:
>> CMAKE_C_FLAGS_DEBUG=-g
>> CMAKE_C_FLAGS_RELWITHDEBINFO=-O2 -g -DNDEBUG
>
> Is -O2 -g really what we want for debugging? Optimized code very often
> doesn't play well with debugging.

To be honest, I don't have a strong opinion about it.

Note that this is the default flags CMake sets; if you add to the
configure opts:
  -DCMAKE_C_FLAGS_RELWITHDEBINFO=-g -O1 -UNDEBUG
then these flags are taken into account, not the default ones.

OTOH, applying no optimization at all in debug build may lead to some
size issues for (very) tiny targets... Who knows? though I don't
remember any bug report/complaint about such a situation.

Regards,

-- 
Samuel
