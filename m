From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 09:28:04 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <CADwac6DEuYjE2cnXVX9rqnQnckOdHSNz+h-CSYvTCQ9Y1U_A-w@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate> <519C636D.9010805@mind.be>
 <CADwac6DEuYjE2cnXVX9rqnQnckOdHSNz+h-CSYvTCQ9Y1U_A-w@mail.gmail.com>
Message-ID: <20130522092804.4ad6f332@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Wed, 22 May 2013 09:55:14 +0300, Assaf Inbal wrote:

> >  We currently probably have many packages that generate .so files even if
> > PREFER_STATIC_LIB is true - that's why it is "prefer", right?
> >
> >  That said, I'm certainly in favour of making the STATIC stuff more strict.
> 
> I think there is some misunderstanding regarding libraries in Lua. When Lua
> libraries are created, they can either be Lua text files or C code that
> uses Lua API so that the library's API can be called from Lua scripts. When
> choosing the latter option, the output must be a shared object, when
> calling the 'require' function in Lua to load an external file, Lua will
> look for file names ending with either 'lua' or 'so'.
> There is simply no way to 'statically link' a Lua library.

Ok. In this case, presumably all those Lua modules/libraries should
have a 'depends on !BR2_PREFER_STATIC_LIB'.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
