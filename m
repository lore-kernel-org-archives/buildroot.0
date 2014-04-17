From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Apr 2014 23:51:44 +0400
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417213939.35afc5ff@skate>
References: <20140417063009.B2279100D24@stock.ovh.net>
 <20140417213939.35afc5ff@skate>
Message-ID: <CAMo8BfJLxhAV8a_JZ4+rx+z7AqiNZ9MuTF1NfMBjR0rMwZROJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 17, 2014 at 11:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>     xtensa |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/a54f3707781dc193292eda7d1723fce6487d6980/
>
> linking ../../lib/libQtCore.so.4.8.5
> .obj/debug-shared-emb-generic/qmetaobject.o:(.debug_line+0x37a4): dangerous relocation: overflow after relaxation
> .obj/debug-shared-emb-generic/qobject.o:(.debug_line+0x55b5): dangerous relocation: overflow after relaxation
> .obj/debug-shared-emb-generic/qlatincodec.o:(.debug_line+0xcd7): dangerous relocation: overflow after relaxation
> .obj/debug-shared-emb-generic/qmetaobject.o:(.debug_frame+0xa89): dangerous relocation: overflow after relaxation
> .obj/debug-shared-emb-generic/qobject.o:(.debug_frame+0xae9): dangerous relocation: overflow after relaxation
> .obj/debug-shared-emb-generic/qlatincodec.o:(.debug_frame+0x1a1): dangerous relocation: overflow after relaxation
> collect2: error: ld returned 1 exit status

[...]

>>     xtensa |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/8a8a0f8cca293ce1f383421ba8b1223b4266e3bc/
>
> Similar Xtensa problem?

Yes, xtensa link-time relaxation is a bit buggy.
Never seen it failing this way before though. Looking at it.

-- 
Thanks.
-- Max
