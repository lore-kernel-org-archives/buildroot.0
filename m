From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jun 2013 15:24:05 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <CAHt8ZCO8PF0gxsvDWtCgWRdpbnUwGoNJmUdqe-eRO9ZKznJVZg@mail.gmail.com>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
 <20130603144414.562f9385@skate>
 <CAHt8ZCO8PF0gxsvDWtCgWRdpbnUwGoNJmUdqe-eRO9ZKznJVZg@mail.gmail.com>
Message-ID: <20130603152405.731dd2a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Mon, 3 Jun 2013 14:12:27 +0100, Simon Dawson wrote:

> The sconeserver configure script doesn't call mysql_config until after
> it has checked for the mysqlclient library; the adjustment of the
> LDFLAGS in the package makefile is needed so that the check for the
> mysqlclient library works correctly. Once this library check has been
> performed, the configure script calls mysql_config to obtain compile
> and link flags for the build.

Ok, the configure script is stupid (checking for a library existence
before calling mysql_config), but ok, I guess we have to live with
that :)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
