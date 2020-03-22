From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 16:48:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <CACGVVZgaDUem-=kenYXu3b+fG2bUHzT55Ohjv7hAGrC4Lgwa1Q@mail.gmail.com>
References: <20200322103143.18772-1-laurent.hartanerot@gmail.com>
 <20200322131255.GB2364@scaer>
 <CACGVVZg_3UzO=B4ZF5LUTnv+QaDhF3OvcyC_y7wHhnQ1gN5P2A@mail.gmail.com>
 <20200322151829.GF2364@scaer>
 <CACGVVZgaDUem-=kenYXu3b+fG2bUHzT55Ohjv7hAGrC4Lgwa1Q@mail.gmail.com>
Message-ID: <20200322154802.GG2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent, All,

On 2020-03-22 16:29 +0100, Laurent Hartanerot spake thusly:
>   That's exactly the purpose of BR2_PYTHON3_HOST_DEPENDENCY: if the
>   build machine already has a python3 (3.4 or later), then there is no
>   need to build our own. If the build machine does not already have
>   python3 or it is older than 3.4, then we need to build our own.
> 
>   See:
>   ? ? support/dependencies/ [1]check-host-python3.mk
>   ? ? support/dependencies/check-host-python3.sh
> 
> ?
> I understand that.
> But, in this case, we cannot use the syntax ($(HOST_DIR)/bin/python3).
> What is the correct syntax ?

Ah, right, I see your problem: you are calling directly to python3. What
you should be able to do then, is something like:

    PATH="$(BR_PATH)"; \
    python3 blablabla...

Regards,
Yann E. MORIN.

>   > Links:
>   > 1. [2]https://patchwork.ozlabs.org/patch/1258063/
>   > 2. mailto: [3]yann.morin.1998 at free.fr
>   > 3. mailto: [4]laurent.hartanerot at atos.net
>   > 4. mailto: [5]laurent.hartanerot at atos.net
>   > 5. [6]http://rcw.mk
>   > 6. [7]http://rcw.mk
>   > 7. [8]http://rcw.mk
>   > 8. [9]http://rcw.mk
>   > 9. [10]http://rcw.mk
>   > 10. [11]https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
>   > 11. [12]http://lists.busybox.net/pipermail/buildroot/2020-March/277531.html
>   > 12. mailto: [13]buildroot at busybox.net
>   > 13. [14]http://lists.busybox.net/mailman/listinfo/buildroot
>   > 14. [15]http://ymorin.is-a-geek.org/
>   > 15. mailto: [16]Laurent.Hartanerot at gmail.com
> 
> Links:
> 1. http://check-host-python3.mk
> 2. https://patchwork.ozlabs.org/patch/1258063/
> 3. mailto:yann.morin.1998 at free.fr
> 4. mailto:laurent.hartanerot at atos.net
> 5. mailto:laurent.hartanerot at atos.net
> 6. http://rcw.mk
> 7. http://rcw.mk
> 8. http://rcw.mk
> 9. http://rcw.mk
> 10. http://rcw.mk
> 11. https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> 12. http://lists.busybox.net/pipermail/buildroot/2020-March/277531.html
> 13. mailto:buildroot at busybox.net
> 14. http://lists.busybox.net/mailman/listinfo/buildroot
> 15. http://ymorin.is-a-geek.org/
> 16. mailto:Laurent.Hartanerot at gmail.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
