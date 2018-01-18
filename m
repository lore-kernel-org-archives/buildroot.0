From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Jan 2018 13:38:19 -0800
Subject: [Buildroot] [PATCH 1/2] package/xen: Force disable SDL for
 xen-qemu build
In-Reply-To: <CANQCQpa49i97qDabZVOAe7Dcp+K=mJpHNHbLkS0Wz=MFairvhQ@mail.gmail.com>
References: <20180118185548.8994-1-alistair.francis@xilinx.com>
 <CANQCQpZqW-4n=12AJM5LCf-ptL=e5i39k9Vcvjyjm9SQOXzhow@mail.gmail.com>
 <CANQCQpY15sA1HHScDLGKn=nrB-UTJNUZXi3zETDdnx9ZsiED8Q@mail.gmail.com>
 <874lnieu2d.fsf@dell.be.48ers.dk>
 <CANQCQpa49i97qDabZVOAe7Dcp+K=mJpHNHbLkS0Wz=MFairvhQ@mail.gmail.com>
Message-ID: <CAKmqyKPnp4FCF6bzAc1_Tph94jBc3=nrn==aGBzPL_Y-cLOkmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 18, 2018 at 1:31 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Peter,
>
> On Thu, Jan 18, 2018 at 3:27 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>>
>> Hi,
>>
>>  > Actually this is cleaner and only sets when the tools build occurs.
>>
>>  > --- a/package/xen/xen.mk
>>  > +++ b/package/xen/xen.mk
>>  > @@ -43,6 +43,7 @@ XEN_DEPENDENCIES += argp-standalone
>>  >  endif
>>  >  XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
>>  >  XEN_MAKE_OPTS += dist-tools
>>  > +XEN_CONF_OPTS =  --with-extra-qemuu-configure-args="--disable-sdl"
>>
>> Agreed, but lease make that += like the rest of the file.
>
> Good catch.

Ok, preparing a patch now. Thanks for the feedback.

Alistair
