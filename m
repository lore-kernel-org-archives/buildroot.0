From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:52:10 +0200
Subject: [Buildroot] [PATCH v2] package/protobuf: needs gcc >= 4.5
In-Reply-To: <20170507133246.23481-1-romain.naour@gmail.com>
References: <20170507133246.23481-1-romain.naour@gmail.com>
Message-ID: <20170507155210.6fa1103a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 15:32:46 +0200, Romain Naour wrote:
> Even with an upstream patch from protobuf v3.3 [1], the build fail with another issue:
> 
> In file included from google/protobuf/dynamic_message.cc:80:
> ./google/protobuf/map_field.h: In member function 'void google::protobuf::internal::MapField<Key, T, key_wire_type, value_wire_type, default_enum_value>::Swap(google::protobuf::internal::MapFieldLite<Key, T, kKeyFieldType, kValueFieldType, default_enum_value>*)':
> ./google/protobuf/map_field.h:139: error: object missing in reference to 'google::protobuf::internal::MapFieldBase::repeated_field_'
> ./google/protobuf/map_field_inl.h:342: error: from this location
> ./google/protobuf/map_field.h:150: error: object missing in reference to 'google::protobuf::internal::MapFieldBase::state_'
> ./google/protobuf/map_field_inl.h:344: error: from this location
> 
> Add a dependency on gcc >= 4.5.
> 
> [1] https://github.com/google/protobuf/commit/a83ac8663fb8042a881bc60b12a8bd3a0c03a3ff
> 
> Fixes:
> http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54
> http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3
> http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Mario J. Rugiero <mrugiero@gmail.com>
> ---
> v2: fix missing reverse dependencies (collectd and riemann-c-client) (ThomasP)
> ---
>  package/collectd/Config.in         | 10 ++++++----
>  package/mosh/Config.in             |  7 +++++--
>  package/ola/Config.in              |  7 +++++--
>  package/protobuf-c/Config.in       |  6 ++++--
>  package/protobuf/Config.in         |  7 +++++--
>  package/python-protobuf/Config.in  |  1 +
>  package/riemann-c-client/Config.in |  6 ++++--
>  7 files changed, 30 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
