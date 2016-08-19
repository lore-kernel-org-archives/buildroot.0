From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 19 Aug 2016 16:02:03 +0200
Subject: [Buildroot] [PATCH] top: fix double free causing a SIGABRT
 storm after SIGPIPE
In-Reply-To: <20160819155700.2730be62@free-electrons.com>
References: <1471614773-7275-1-git-send-email-luca@lucaceresoli.net>
 <20160819155700.2730be62@free-electrons.com>
Message-ID: <e82db706-7be6-c55a-02b2-c385c7118a6d@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 19/08/2016 15:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 19 Aug 2016 15:52:53 +0200, Luca Ceresoli wrote:
>> On some platforms the command 'top -n1 | head' goes very often into an
>> infinite loop of SIGABRT and double free()s.
>>
>> Fix by applying a patch from upstream.
>>
>> For a detailed explanation of the bug, see
>> http://lists.busybox.net/pipermail/busybox/2016-August/084555.html
>>
>> Thanks to Yann for the help in finding this bug.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  ...op-move-free-prev_hist-out-of-signal-path.patch | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch
> 
> Applied to master, after changing the commit title: you're changing the
> "busybox" package, not the "top" package.

Ouch, sorry and thanks!

-- 
Luca
