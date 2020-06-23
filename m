From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 23 Jun 2020 21:36:54 +0300
Subject: [Buildroot] Is there a way to alter BR2_CMAKE_VERSION_MIN?
Message-ID: <CALFsTFXiiOb7t0Biw30OXjVLXwfd1x-dmjtnEDQy+Ogmi4ZU-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Currently, BR2_CMAKE_VERSION_MIN is set to 3.10.
On my machine I have cmake=3.12 and on my BR2_EXTERNAL tree I have
some private packages requiring cmake>=3.13.
In the current state, Buildroot won't build host-cmake since the
installed one is greater than 3.10, but still the compilation fails
because those packages need a higher version from what I have on my
machine.

Is there a reason why BR2_CMAKE_VERSION_MIN isn't set with "?=" but
with "="? Setting it with "?=" gives the user the option to change it
in case there are private packages which need a higher version of
CMake.

Any other ideas on how to overcome this issue?

Thanks,
Asaf.
