From: Mario Rugiero <mrugiero@gmail.com>
Date: Fri, 5 May 2017 15:27:21 -0300
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <20170505202049.643d7041@free-electrons.com>
References: <20170503205945.7065-1-mrugiero@gmail.com>
 <20170504145610.39ba9d06@free-electrons.com>
 <CAKKQwLSKh5LijFRDNDXmocqgxtgSk1Gt_8vh8wnFDbCPbtdZJg@mail.gmail.com>
 <CAKKQwLQWLytghCPeEWWjMsLw2vrcL-DumzWcevz2Dz+uwE0HGQ@mail.gmail.com>
 <20170505202049.643d7041@free-electrons.com>
Message-ID: <CAKKQwLS=83fJSV2hKHNm9VR_nD9jCc13eVF_35gqLKEq9TPmbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-05-05 15:20 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri, 5 May 2017 14:24:00 -0300, Mario Rugiero wrote:
>
>> I fixed that particular issue in my local copy, but fails because
>> Atomic32 is not supported in that toolchain.
>> Do you know if there is any similar toolchain with such support?
>> Otherwise, how should I fix that?
>
> What error do you have exactly?

/bin/sh ../libtool  --tag=CXX   --mode=compile
/home/mrugiero/workspace/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-g++
-DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -DHAVE_PTHREAD=1  -Wall
-Wno-sign-compare  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -c -o google/protobuf/dynamic_message.lo
goo
gle/protobuf/dynamic_message.cc
libtool: compile:
/home/mrugiero/workspace/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-g++
-DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pthread -DHAVE_PTHREAD=1 -Wall
-Wno-sign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -c google/protobuf/dynamic_message.cc
-fPIC -DPIC -o google/protobuf/.libs/dy
namic_message.o
In file included from google/protobuf/dynamic_message.cc:82:
./google/protobuf/map_field.h: In member function 'void
google::protobuf::internal::MapField<Derived, Key, Value,
kKeyFieldType, kValueFieldType,
default_enum_value>::Swap(google::protobuf::internal::MapField<Derived,
Key, Value, kKeyFieldType, kValueFieldType, default_enum_value>*)':
./google/protobuf/map_field.h:139: error: object missing in reference
to 'google::protobuf::internal::MapFieldBase::repeated_field_'
./google/protobuf/map_field_inl.h:255: error: from this location
./google/protobuf/map_field.h:143: error: object missing in reference
to 'google::protobuf::internal::MapFieldBase::state_'
./google/protobuf/map_field_inl.h:257: error: from this location

>
> Something like an undefined reference to some __atomic_*() function? If
> so, then make sure you link with -latomic.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
