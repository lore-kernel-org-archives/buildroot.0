From: Michal Pluska <michal.pluska2@gmail.com>
Date: Fri, 16 Jul 2021 14:53:50 +0200
Subject: [Buildroot] rpi3_qt5we build issu
Message-ID: <CAMBXMtbWu2e63Kb+MLfj7Jrh+NU6HpCBA86OKSqRXcyHu-M=VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210716125350.mJshqCw-aRMobk1laeuSs_q4BG_wCakJGv3zyh1sEa4@z>

Hello,

I try to build this configuration: raspberrypi3_qt5we_defconfig; This patch
had to be applied:
https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report at gmx.net/

still I get following build error:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33:
warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)?
specified bound between 4294967288 and 4294967295 exceeds maximum object
size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0
(__dest));
      |
 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[14642/20194] CXX
obj/content/browser/browser/browser_accessibility_state_impl.o
FAILED: obj/content/browser/browser/browser_accessibility_state_impl.o

What is still missing?
I could repeat this build error on two machines...

Kind Regards,
Mipl
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210716/96450e74/attachment-0002.html>
-------------- next part --------------
[14614/20194] CXX obj/components/services/storage/public/mojom/mojom/indexed_db_control_test.mojom.o
In file included from ../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/string.h:519,
                 from /home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/include/c++/9.3.0/cstring:42,
                 from ../../3rdparty/chromium/base/logging.h:12,
                 from ../../3rdparty/chromium/base/memory/ref_counted.h:16,
                 from ../../3rdparty/chromium/base/callback_internal.h:14,
                 from ../../3rdparty/chromium/base/callback.h:15,
                 from gen/components/services/storage/public/mojom/indexed_db_control_test.mojom.h:16,
                 from gen/components/services/storage/public/mojom/indexed_db_control_test.mojom.cc:12:
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?static void mojo::internal::Serializer<mojo_base::mojom::FilePathDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo_base::mojom::internal::FilePath_Data::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const base::FilePath]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16,
    inlined from ?void storage::mojom::IndexedDBControlTest_GetFilePathForTesting_ProxyToResponder::Run(const base::FilePath&)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?static void mojo::internal::Serializer<mojo_base::mojom::FilePathDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo_base::mojom::internal::FilePath_Data::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const base::FilePath]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16,
    inlined from ?void storage::mojom::IndexedDBControlTest_GetPathForBlobForTesting_ProxyToResponder::Run(const base::FilePath&)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?static void mojo::internal::Serializer<mojo_base::mojom::FilePathDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo_base::mojom::internal::FilePath_Data::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const base::FilePath]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16,
    inlined from ?void storage::mojom::IndexedDBControlTest_GetBaseDataPathForTesting_ProxyToResponder::Run(const base::FilePath&)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?void storage::mojom::IndexedDBControlTest_GetDatabaseKeysForTesting_ProxyToResponder::Run(const string&, const string&)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?void storage::mojom::IndexedDBControlTest_GetDatabaseKeysForTesting_ProxyToResponder::Run(const string&, const string&)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?virtual void storage::mojom::IndexedDBControlTestProxy::WriteToIndexedDBForTesting(const url::Origin&, const string&, const string&, storage::mojom::IndexedDBControlTest::WriteToIndexedDBForTestingCallback)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?virtual void storage::mojom::IndexedDBControlTestProxy::WriteToIndexedDBForTesting(const url::Origin&, const string&, const string&, storage::mojom::IndexedDBControlTest::WriteToIndexedDBForTestingCallback)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[14619/20194] CXX obj/components/services/storage/public/mojom/mojom/partition.mojom.o
In file included from ../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/string.h:519,
                 from /home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/include/c++/9.3.0/cstring:42,
                 from ../../3rdparty/chromium/base/logging.h:12,
                 from ../../3rdparty/chromium/base/memory/ref_counted.h:16,
                 from ../../3rdparty/chromium/base/callback_internal.h:14,
                 from ../../3rdparty/chromium/base/callback.h:15,
                 from gen/components/services/storage/public/mojom/partition.mojom.h:16,
                 from gen/components/services/storage/public/mojom/partition.mojom.cc:12:
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?static void mojo::internal::Serializer<url::mojom::OriginDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, url::mojom::internal::Origin_Data::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const url::Origin]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16,
    inlined from ?virtual void storage::mojom::PartitionProxy::BindOriginContext(const url::Origin&, mojo::PendingReceiver<storage::mojom::OriginContext>)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?void* memcpy(void*, const void*, size_t)?,
    inlined from ?static void mojo::internal::Serializer<mojo::StringDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, mojo::internal::Array_Data<char>::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const std::__cxx11::basic_string<char>]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/string_serialization.h:34:11,
    inlined from ?static void mojo::internal::Serializer<url::mojom::OriginDataView, MaybeConstUserType>::Serialize(MaybeConstUserType&, mojo::internal::Buffer*, url::mojom::internal::Origin_Data::BufferWriter*, mojo::internal::SerializationContext*) [with MaybeConstUserType = const url::Origin]? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16,
    inlined from ?virtual void storage::mojom::PartitionProxy::BindOriginContext(const url::Origin&, mojo::PendingReceiver<storage::mojom::OriginContext>)? at ../../3rdparty/chromium/mojo/public/cpp/bindings/lib/serialization_forward.h:44:16:
../../../../../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/string_fortified.h:29:33: warning: ?void* __builtin_memcpy(void*, const void*, unsigned int)? specified bound between 4294967288 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
   29 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
      |          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[14642/20194] CXX obj/content/browser/browser/browser_accessibility_state_impl.o
FAILED: obj/content/browser/browser/browser_accessibility_state_impl.o 
/home/mipl/rpi3/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -MMD -MF obj/content/browser/browser/browser_accessibility_state_impl.o.d -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=3fcc1d4e44127006318371002a0f421a4fde2ab4 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -DCONTENT_IMPLEMENTATION -DWEBP_EXTERN=extern -DVK_NO_PROTOTYPES -DUSE_EGL -DU_USING_ICU_NAMESPACE=0 -DU_ENABLE_DYLOAD=0 -DUSE_CHROMIUM_ICU=1 -DU_ENABLE_TRACING=1 -DU_ENABLE_RESOURCE_TRACING=0 -DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_FILE -DUCHAR_TYPE=uint16_t -DGOOGLE_PROTOBUF_NO_RTTI -DGOOGLE_PROTOBUF_NO_STATIC_INITIALIZER -DHAVE_PTHREAD -DSK_CODEC_DECODES_PNG -DSK_CODEC_DECODES_WEBP -DSK_ENCODE_PNG -DSK_ENCODE_WEBP -DSK_USER_CONFIG_HEADER=\"../../skia/config/SkUserConfig.h\" -DSK_GL -DSK_CODEC_DECODES_JPEG -DSK_ENCODE_JPEG -DSK_USE_LIBGIFCODEC -DSK_VULKAN_HEADER=\"../../skia/config/SkVulkanConfig.h\" -DSK_VULKAN=1 -DSK_SUPPORT_GPU=1 -DSK_GPU_WORKAROUNDS_HEADER=\"gpu/config/gpu_driver_bug_workaround_autogen.h\" -DVK_NO_PROTOTYPES -DCRASHPAD_ZLIB_SOURCE_EXTERNAL -DLEVELDB_PLATFORM_CHROMIUM=1 -DLEVELDB_PLATFORM_CHROMIUM=1 -DWEBRTC_NON_STATIC_TRACE_EVENT_HANDLERS=0 -DWEBRTC_CHROMIUM_BUILD -DWEBRTC_POSIX -DWEBRTC_LINUX -DABSL_ALLOCATOR_NOTHROW=1 -DWEBRTC_USE_BUILTIN_ISAC_FIX=1 -DWEBRTC_USE_BUILTIN_ISAC_FLOAT=0 -DHAVE_SCTP -DNO_MAIN_THREAD_WRAPPING -DSQLITE_OMIT_ANALYZE -DSQLITE_OMIT_AUTOINIT -DSQLITE_OMIT_AUTORESET -DSQLITE_OMIT_COMPILEOPTION_DIAGS -DSQLITE_OMIT_COMPLETE -DSQLITE_OMIT_EXPLAIN -DSQLITE_OMIT_GET_TABLE -DSQLITE_DEFAULT_LOOKASIDE=0,0 -DSQLITE_OMIT_LOOKASIDE -DSQLITE_OMIT_TCL_VARIABLE -DSQLITE_OMIT_REINDEX -DSQLITE_OMIT_TRACE -DSQLITE_OMIT_UPSERT -DSQLITE_OMIT_WINDOWFUNC -DSQLITE_ENABLE_FTS3 -DSQLITE_DISABLE_FTS3_UNICODE -DSQLITE_DISABLE_FTS4_DEFERRED -DSQLITE_ENABLE_ICU -DSQLITE_SECURE_DELETE -DSQLITE_THREADSAFE=1 -DSQLITE_MAX_WORKER_THREADS=0 -DSQLITE_MAX_MMAP_SIZE=268435456 -DSQLITE_DEFAULT_FILE_PERMISSIONS=0600 -DSQLITE_DEFAULT_MEMSTATUS=1 -DSQLITE_DEFAULT_PAGE_SIZE=4096 -DSQLITE_DEFAULT_PCACHE_INITSZ=0 -DSQLITE_LIKE_DOESNT_MATCH_BLOBS -DSQLITE_OMIT_DEPRECATED -DSQLITE_OMIT_PROGRESS_CALLBACK -DSQLITE_OMIT_SHARED_CACHE -DSQLITE_USE_ALLOCA -DSQLITE_OMIT_DECLTYPE -DSQLITE_OMIT_LOAD_EXTENSION -DSQLITE_HAVE_ISNAN -DSQLITE_ENABLE_BATCH_ATOMIC_WRITE -DSQLITE_TEMP_STORE=3 -DSQLITE_ENABLE_LOCKING_STYLE=0 -DPERFETTO_IMPLEMENTATION -DV8_DEPRECATION_WARNINGS -Igen -I../../3rdparty/chromium -Igen -I../../3rdparty/chromium/third_party/perfetto/include -Igen/third_party/perfetto/build_config -Igen/third_party/perfetto -Igen -I../../3rdparty/chromium/third_party/libwebp/src -Igen -I../../3rdparty/chromium/third_party/vulkan/include -I../../3rdparty/chromium/third_party/libyuv/include -Igen -I../../3rdparty/chromium/third_party/khronos -I../../3rdparty/chromium/gpu -Igen/third_party/dawn/src/include -I../../3rdparty/chromium/third_party/dawn/src/include -I../../3rdparty/chromium/third_party/jsoncpp/source/include -I../../3rdparty/chromium/third_party/jsoncpp/generated -Igen -I../../3rdparty/chromium/third_party/boringssl/src/include -I../../3rdparty/chromium/third_party/ced/src -I../../3rdparty/chromium/third_party/icu/source/common -I../../3rdparty/chromium/third_party/icu/source/i18n -I../../3rdparty/chromium/third_party/protobuf/src -I../../3rdparty/chromium/third_party/protobuf/src -Igen/protoc_out -I../../3rdparty/chromium/third_party/skia -I../../3rdparty/chromium/third_party/libgifcodec -I../../3rdparty/chromium/third_party/vulkan/include -I../../3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator -I../../3rdparty/chromium/third_party/vulkan/include -I../../3rdparty/chromium/third_party/crashpad/crashpad -I../../3rdparty/chromium/third_party/crashpad/crashpad/compat/non_mac -I../../3rdparty/chromium/third_party/crashpad/crashpad/compat/linux -I../../3rdparty/chromium/third_party/crashpad/crashpad/compat/non_win -I../../3rdparty/chromium/third_party/zlib -I../../3rdparty/chromium/third_party/libwebm/source -I../../3rdparty/chromium/third_party/leveldatabase -I../../3rdparty/chromium/third_party/leveldatabase/src -I../../3rdparty/chromium/third_party/leveldatabase/src/include -I../../3rdparty/chromium/third_party/webrtc_overrides -I../../3rdparty/chromium/third_party/webrtc -Igen/third_party/webrtc -I../../3rdparty/chromium/third_party/abseil-cpp -Igen/third_party/metrics_proto -I../../3rdparty/chromium/third_party/perfetto -I../../3rdparty/chromium/third_party/perfetto/include -Igen/third_party/perfetto/build_config -Igen/third_party/perfetto -I../../3rdparty/chromium/v8/include -Igen/v8/include -I../../3rdparty/chromium/third_party/mesa_headers -I../../3rdparty/chromium/third_party/angle/src/common/third_party/base -Igen/angle -I../../3rdparty/chromium/third_party/angle/include -I../../3rdparty/chromium/third_party/brotli/include -I../../3rdparty/chromium/third_party/re2/src -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16 -marm -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-psabi -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden -I/home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/nss -I/home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/nspr -I/home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0 -I/home/mipl/rpi3/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include -std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot -fvisibility-inlines-hidden -Wno-deprecated-declarations -c ../../3rdparty/chromium/content/browser/accessibility/browser_accessibility_state_impl.cc -o obj/content/browser/browser/browser_accessibility_state_impl.o
arm-buildroot-linux-gnueabihf-g++.br_real: fatal error: Killed signal terminated program cc1plus
compilation terminated.
[14644/20194] CXX obj/content/browser/browser/storage_partition_impl.o
ninja: build stopped: subcommand failed.
make[5]: *** [Makefile.gn_run:360: run_ninja] Error 1
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:250: /home/mipl/rpi3/buildroot/output/build/qt5webengine-5.15.2/.stamp_built] Error 2
