From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 16:31:05 +0200
Subject: [Buildroot] [sources.buildroot.net] listing not available
In-Reply-To: <CAL3OuNx_2RnrVJikft_iYbah_eGTgqYFJPsobqyOFnkfSD_eyQ@mail.gmail.com>
 (Bruno N.'s message of "Thu, 31 May 2018 10:07:03 +0200")
References: <CAL3OuNxjyRhG2c3-fBakZ7iSd+Vf+KqrKBdOSwzDrcNM_ajGqw@mail.gmail.com>
 <87po1d2l9i.fsf@dell.be.48ers.dk>
 <CAL3OuNx_2RnrVJikft_iYbah_eGTgqYFJPsobqyOFnkfSD_eyQ@mail.gmail.com>
Message-ID: <87tvqmzihi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bruno" == Bruno N <belgarath116@gmail.com> writes:

Hi,

 >> > Or maybe are they an other way to make a copy of the repository ?
 >> 
 >> If you just want to make sure you have downloaded everything needed to
 >> build a specific configuration then you can use 'make source'
 >> 
 >> --
 >> Bye, Peter Korsgaard
 >> 

 > I'm not the only user of this offline repository
 > This way :
 >  - Doing a 'make source' on the offline computer, put the list on USB key,
 > donwload need pakages on usb key, put packages on offline repository
 > look longer than :
 >  - Download everything on usb key and put it on offline repository

If you have a >160GB USB key. The problem is that "everything" also
includes all the older package versions, so you will be downloading way
too much to ever be useful. I'm not sure our mirror hosting would like
lots of people to grab all 160GB. We are currently at ~25GB/day as it is.

 > The second reason i download all the repository is, if another user build
 > with different package he dont need to ask me to download them from the
 > website and put it on the offline repository.
 > Downloading all the repository is not a very elegant way .... but i dont
 > have tool like 'apt-mirror' for buildroot.
 > Maybe there is a way to donwload all packages related to an buildroot
 > release?

Sorry, there isn't. You can configure buildroot to the architecture you
need and then run make allyespackageconfig; make source to download the
default version of all packages available for that architecture, but it
will not handle packages with version selection or packages only
available on other architectures.

-- 
Bye, Peter Korsgaard
