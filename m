From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 6 Mar 2013 20:02:02 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lucas,

2013/3/6 Luca Ceresoli <luca@lucaceresoli.net>:
> CMake fails in detecting the compiler when ccache is used. Add a wrapper
> script to make it happy.

It is possible to do this without any wrapper, setting
CMAKE_C_COMPILER and CMAKE_CXX_COMPILER to the ccache binary path, and
CMAKE_C_COMPILER_ARG1 and CMAKE_CXX_COMPILER_ARG1 to the actual
C-compiler, respectively to the C++-compiler.

BTW, note that we currently don't handle space in the paths at all;
hope that nobody triggers issues related to this ;)

Regards,

-- 
Samuel
