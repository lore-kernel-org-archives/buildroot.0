From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 23 Aug 2018 11:24:47 +0200
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
Message-ID: <6362092b-e799-47b1-9066-97b8118d27b5@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 22. srpna 2018 23:58:30 CEST, Baruch Siach wrote:
> +# cmake older than 3.10 require this to avoid try_run() in FindThreads
> +LIBSSH_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

Are you sure that this is a correct fix? From reading the 
FindThreads.cmake, passing OFF looks like it results in not feeding the 
-pthread option to the compiler. That breaks some scenarios such as ASAN, 
see [1] for details.

Cheers,
Jan

[1] https://gitlab.kitware.com/cmake/cmake/issues/16609
