From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 11:46:34 +0200
Subject: [Buildroot] [PATCH v3 2/7] board/guest: documentation and
 sample files
In-Reply-To: <20200621080000.180089-3-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jun 2020 09:59:55 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-3-francois.perrad@gadz.org>
Message-ID: <87sgdduw79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  DEVELOPERS             |   1 +
 >  board/guest/Dockerfile |   2 +
 >  board/guest/readme.txt | 143 +++++++++++++++++++++++++++++++++++++++++
 >  3 files changed, 146 insertions(+)
 >  create mode 100644 board/guest/Dockerfile
 >  create mode 100644 board/guest/readme.txt

..

 > +How to with Docker
 > +==================
 > +
 > +A Docker image could created with a Dockerfile and few commands are needed:
 > +
 > +    # dockerd &
 > +
 > +    $ cat Dockerfile
 > +    FROM scratch
 > +    ADD rootfs.tar /
 > +    $ docker build --tag br:guest .
 > +    $ docker images
 > +    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 > +    br                  guest               0c54c85a3452        42 seconds ago      1.75MB

NIT: Why not just use docker import rootfs.tar br:test?

-- 
Bye, Peter Korsgaard
