From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 17:13:18 +0200
Subject: [Buildroot] [PATCH] yajl: fix static linking in a parallel build
In-Reply-To: <1459538292-7023-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459538292-7023-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160402171318.653fec21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 21:18:12 +0200, J?rg Krause wrote:

> + FOREACH (test ${TESTS})
> +   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
> +   ADD_EXECUTABLE(${testProg} ${test})
> +-  TARGET_LINK_LIBRARIES(${testProg} yajl m)
> ++  TARGET_LINK_LIBRARIES(${testProg} yajl_s m)

I am not sure to understand why this would fix the parallel build
issue. The parallel build problem comes from the fact that the library
and tests sit in different directories, and that they are built in
parallel with each other. Both the yajl and yajl_s libraries are built
in the same directory, separate from the tests directory. So I don't
quite see how changing from using yajl to yajl_s is going to make a
difference here. But maybe I'm missing something.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
