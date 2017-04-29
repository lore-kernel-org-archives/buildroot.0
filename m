From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:31:36 +0200
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <20170426162850.5214-1-mrugiero@gmail.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
Message-ID: <20170429143136.3da63d52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 13:28:50 -0300, mrugiero at gmail.com wrote:
> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> 
> Protobuf hits a bug in gcc < 4.5 which breaks the build.
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=189

This bug is marked as FIXED, and it has been fixed since many years.

What is the actual problem you are seeing? Is there a reference to an
autobuilder issue?

I've tried to build with gcc 4.3, and indeed I'm getting:

./google/protobuf/metadata.h: In constructor 'google::protobuf::internal::InternalMetadataWithArena::InternalMetadataWithArena(google::protobuf::Arena*)':
./google/protobuf/metadata.h:175: error: class 'google::protobuf::internal::InternalMetadataWithArena' does not have any field named 'InternalMetadataWithArenaBase'
./google/protobuf/metadata.h: In constructor 'google::protobuf::internal::InternalMetadataWithArenaLite::InternalMetadataWithArenaLite(google::protobuf::Arena*)':
./google/protobuf/metadata.h:204: error: class 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have any field named 'InternalMetadataWithArenaBase'

Is this the issue we're talking about ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
