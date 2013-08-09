From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Aug 2013 22:29:06 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LX6XCAwSXWtHPxkc7Q2+-pFeaGyuNO0k4ZRH-MdA3U5MQ@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
 <CAAXf6LVdx1h2qm8767UCavTqTR1q-L8Z0Kv93zqCfE8OqyYd5w@mail.gmail.com>
 <CAHt8ZCO+G8E3EggLj8KFRHhvxiPzCFT_LwZQyniEed3Q2BfL-Q@mail.gmail.com>
 <CAAXf6LWJTQCWH-rEppNNVy_j2SJacecaWGwXxgiW-q7JboO3=Q@mail.gmail.com>
 <CAHt8ZCP6LiPDV+utoknppQ-O1gYtTSgSCYrpokXDUW67+W8-Ow@mail.gmail.com>
 <CAAXf6LUqGG9O2eWfokH8VAuxa-2xDw=yKw-1vq_9VBpzotCjKA@mail.gmail.com>
 <CAHt8ZCOkiQN0RKe2xa0MyjNnyCLGodCB_ma6Agd6FF_yHof9sQ@mail.gmail.com>
 <CAAXf6LX6XCAwSXWtHPxkc7Q2+-pFeaGyuNO0k4ZRH-MdA3U5MQ@mail.gmail.com>
Message-ID: <20130809222906.16bb49ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 9 Aug 2013 13:12:51 +0200, Thomas De Schampheleire wrote:

> I can now also confirm that setting HOSTCC and HOSTCXX explicitly to
> gcc-4.6 and g++-4.8, is the key to getting C++ support to build for
> AVR32.
> 
> One approach to guard against such problems is to check this in
> dependencies.sh/mk: if AVR32 is selected with C++ toolchain support,
> and the host gcc is newer than 4.6 (or maybe newer-or-equal-than
> 4.7.0; not sure where the problem was introduced), then we bail out
> and ask the user to either disable C++ support, set their host
> compiler to an older version, or select another architecture (kidding
> about that last one, of course).

That's the only reasonable solution I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
