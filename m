From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 17:58:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <1471a17e-814d-eba7-5756-fe5dd592b5db@railnova.eu> (Titouan
 Christophe's message of "Fri, 2 Aug 2019 15:18:57 +0200")
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
 <871ry518wo.fsf@dell.be.48ers.dk> <87sgqlyxov.fsf@dell.be.48ers.dk>
 <b1957631-ca8b-38ab-9b24-5549e8e13e23@railnova.eu>
 <874l30x0fd.fsf@dell.be.48ers.dk>
 <1471a17e-814d-eba7-5756-fe5dd592b5db@railnova.eu>
Message-ID: <87imrfsgn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

Hi,

 > Indeed, when doing a regular make (and not test-pkg) with this
 > defconfig I can reproduce the aforementioned failure.

Funky, but OK.


 > Now, when looking at mosquitto, I understand that
 > WITH_SHARED_LIBRARY=no implies that libmosquitto.so won't be created
 > (and linked against).

 > However, the failure over here is due to some code in the broker which
 > is intended to dynamically load modules at runtime, no matter if
 > mosquitto is running inside a statically linked executable or from a
 > dylib.

 > As such, I suggest then to only make the broker depend on
 > BR2_SHARED_LIBS, while still allowing the client lib to be built
 > statically, which in my opinion makes sense for embedded targets.
 > What do you think ?

Yes, that could work. Will you send a patch for that?

-- 
Bye, Peter Korsgaard
