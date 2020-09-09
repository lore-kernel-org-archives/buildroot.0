From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 21:53:09 +0200
Subject: [Buildroot] [PATCH v2 0/4] pycompile: fix .pyc source paths +
 improvements
In-Reply-To: <20200908081026.4701-1-robin.jarry@6wind.com>
References: <20200908081026.4701-1-robin.jarry@6wind.com>
Message-ID: <20200909195309.GQ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin, All,

On 2020-09-08 10:10 +0200, Robin Jarry spake thusly:
> This series is about fixing the original .py source paths encoded into
> .pyc files. It comes with small improvements on pycompile.py as well.

Thanks for this new iteration.

> The first version of the patch was actually not working at all... No
> .pyc file was compiled. We did not see it because
> BR2_PACKAGE_PYTHON*_PYC_ONLY were not selected and therefore, the .pyc
> files were generated automatically at runtime.
> 
> This v2 should work properly.
> 
> Robin Jarry (4):
>   pycompile: add main entry point
>   pycompile: sort imports

I've applied those two ones.

>   pycompile: fix .pyc original source file paths
>   pycompile: add --verbose option

I have some comments about those two, so I'll reply separately.

Regards,
Yann E. MORIN.

> 
>  package/python/python.mk     |   6 +-
>  package/python3/python3.mk   |   6 +-
>  support/scripts/pycompile.py | 158 +++++++++++++++++++++--------------
>  3 files changed, 104 insertions(+), 66 deletions(-)
> 
> Differences with v1:
> 
>   * split in multiple commits
>   * fixed the script itself
>   * sorted imports at the top of the file
>   * added new --verbose option
> 
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
