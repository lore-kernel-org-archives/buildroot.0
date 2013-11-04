From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Nov 2013 00:19:10 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <CAE9DZUTmGnAUh7=yS5YzP7Se_bmQjRrNK5VuoG5NDWGn6hmc0w@mail.gmail.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <5d58cf72-cd29-4f75-b348-4b59b4941a2f@email.android.com>
 <CAE9DZUTgeeZTveEYUdHrDwpEP_iqqcd=JrPp6qWaVP_Huti3_w@mail.gmail.com>
 <CAAXf6LW1TJ5oXRYBMBMC3O91653rmuP87wUbVike=9nGZANtsQ@mail.gmail.com>
 <CAE9DZURjHTfx+sYDazhnJPdXOYZe8ye9Ue=bBOJo5_3_V6521g@mail.gmail.com>
 <CAE9DZUTmGnAUh7=yS5YzP7Se_bmQjRrNK5VuoG5NDWGn6hmc0w@mail.gmail.com>
Message-ID: <20131105001910.3a5d6e13@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Mon, 4 Nov 2013 17:15:24 -0600, Dallas Clement wrote:

> Does anyone know if there is still a shared configuration cache
> option?  I might get some mileage out of that.

No, we removed it years ago. Different configure.ac scripts use
identical variable names in the cache to store the result of tests that
are not exactly the same. It was causing too much breakage, so we
removed it.

commit 5f71fc1f19c21676f029b63499e0341a89cf2049
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Thu Nov 4 20:31:25 2010 +0100

    Remove support for shared configuration cache
    
    The configuration cache shared between packages, while being in
    principle a nice idea to speed-up the configuration of packages by
    avoiding repetitive identical checks, turned out to be unreliable due
    to the subtle differences between similar but not identical checks in
    different packages. After spending some time trying to fix those, we
    concluded that supporting the shared configuration cache is definitely
    too hard and too unreliable, and that we'd better get rid of it
    altogether.
    
    This patch therefore removes the shared configuration cache
    infrastructure and usage.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
