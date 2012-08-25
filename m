From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 19:17:02 +0200
Subject: [Buildroot] [PATCH v4 2/2] nodejs: new package
In-Reply-To: <20120825191538.4f545a35@skate>
References: <1344827150-25067-1-git-send-email-net147@gmail.com>
 <1344827150-25067-3-git-send-email-net147@gmail.com>
 <20120825191538.4f545a35@skate>
Message-ID: <20120825191702.01758306@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 25 Aug 2012 19:15:38 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> nodejs includes V8 for executing the JavaScript code, and V8 generates
> machine code to provide good performances when executing JavaScript.
> This means that V8 is architecture dependent: apparently, in deps/v8/,
> only IA32, x86-64, ARM and MIPS are supported.
> 
> However, I don't understand how you select the target architecture or
> how it is detected. Some comments in the configure script also seem to
> imply that on ARM, only ARMv7 is supported by V8.
> 
> Have you checked this, or did you try only a x86->x86 build?

And also, it doesn't work here (Linaro 2012.02 toolchain, ARM) :

>>> nodejs 0.8.6 Configuring
(cd /home/thomas/projets/buildroot/output/build/nodejs-0.8.6; PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/thomas/sys/bin" AR="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-ar" AS="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-as" LD="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-ld" NM="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-nm" CC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc" GCC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc" CPP="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-cpp" CXX="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-g++" FC="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-gfortran" RANLIB="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-ranlib" STRIP="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-strip" OBJCOPY="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-objcopy" OBJDUMP="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 -I/home/thomas/projets/buildroot/output/host/include -I/home/thomas/projets/buildroot/output/host/usr/include" CXXFLAGS_FOR_BUILD="-I/home/thomas/projets/buildroot/output/host/include -I/home/thomas/projets/buildroot/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/thomas/projets/buildroot/output/host/lib -L/home/thomas/projets/buildroot/output/host/usr/lib -Wl,-rpath,/home/thomas/projets/buildroot/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-as" DEFAULT_LINKER="/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-ld" CFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/usr/bin/pkg-config" PERLLIB="/home/thomas/projets/buildroot/output/host/usr/lib/perl" STAGING_DIR="/home/thomas/projets/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot" PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/usr/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/thomas/sys/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/thomas/sys/bin" ./configure --prefix=/usr --without-snapshot --without-ssl   --without-dtrace --without-etw )
{ 'target_defaults': { 'cflags': [],
                       'default_configuration': 'Release',
                       'defines': [],
                       'include_dirs': [],
                       'libraries': []},
  'variables': { 'armv7': 1,
                 'host_arch': 'arm',
                 'node_install_npm': 'true',
                 'node_install_waf': 'true',
                 'node_prefix': '/usr',
                 'node_shared_openssl': 'false',
                 'node_shared_v8': 'false',
                 'node_shared_zlib': 'false',
                 'node_use_dtrace': 'false',
                 'node_use_etw': 'false',
                 'node_use_openssl': 'false',
                 'target_arch': 'arm',
                 'v8_no_strict_aliasing': 1,
                 'v8_use_arm_eabi_hardfloat': 'false',
                 'v8_use_snapshot': 'false'}}
creating  ./config.gypi
creating  ./config.mk
Traceback (most recent call last):
  File "tools/gyp_node", line 58, in <module>
    run_gyp(gyp_args)
  File "tools/gyp_node", line 18, in run_gyp
    rc = gyp.main(args)
  File "./tools/gyp/pylib/gyp/__init__.py", line 471, in main
    options.circular_check)
  File "./tools/gyp/pylib/gyp/__init__.py", line 111, in Load
    depth, generator_input_info, check, circular_check)
  File "./tools/gyp/pylib/gyp/input.py", line 2378, in Load
    depth, check)
  File "./tools/gyp/pylib/gyp/input.py", line 430, in LoadTargetBuildFile
    includes, depth, check)
  File "./tools/gyp/pylib/gyp/input.py", line 384, in LoadTargetBuildFile
    build_file_data, PHASE_EARLY, variables, build_file_path)
  File "./tools/gyp/pylib/gyp/input.py", line 1027, in ProcessVariablesAndConditionsInDict
    ProcessConditionsInDict(the_dict, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 904, in ProcessConditionsInDict
    variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1053, in ProcessVariablesAndConditionsInDict
    build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1068, in ProcessVariablesAndConditionsInList
    ProcessVariablesAndConditionsInDict(item, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1053, in ProcessVariablesAndConditionsInDict
    build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1068, in ProcessVariablesAndConditionsInList
    ProcessVariablesAndConditionsInDict(item, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1027, in ProcessVariablesAndConditionsInDict
    ProcessConditionsInDict(the_dict, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 904, in ProcessConditionsInDict
    variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1027, in ProcessVariablesAndConditionsInDict
    ProcessConditionsInDict(the_dict, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 904, in ProcessConditionsInDict
    variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 1027, in ProcessVariablesAndConditionsInDict
    ProcessConditionsInDict(the_dict, phase, variables, build_file)
  File "./tools/gyp/pylib/gyp/input.py", line 885, in ProcessConditionsInDict
    if eval(ast_code, {'__builtins__': None}, variables):
  File "<string>", line 1, in <module>
NameError: name 'arm_neon' is not defined while evaluating condition 'arm_neon!=1 and arm_fpu!="vfpv3" and arm_fpu!="vfpv3-d16"' in /home/thomas/projets/buildroot/output/build/nodejs-0.8.6/deps/v8/tools/gyp/v8.gyp while loading dependencies of /home/thomas/projets/buildroot/output/build/nodejs-0.8.6/node.gyp while trying to load /home/thomas/projets/buildroot/output/build/nodejs-0.8.6/node.gyp

Thomas

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
