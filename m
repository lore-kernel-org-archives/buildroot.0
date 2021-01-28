From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:05:21 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: fix build if
 clang-tidy is installed on the host
In-Reply-To: <20210119171742.23245-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 19 Jan 2021 18:17:41 +0100")
References: <20210119171742.23245-1-patrickdepinguin@gmail.com>
Message-ID: <878s8c25fi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > opentracing-cpp fails to build if clang-tidy is installed:

 > ...
 > -- clang-tidy found: /usr/lib/llvm/11/bin/clang-tidy
 > -- Configuring done
 > -- Generating done
 > ...

 > [ 25%] Building CXX object CMakeFiles/opentracing.dir/src/propagation.cpp.o
 > .../buildroot/output/build/opentracing-cpp-1.5.1/include/opentracing/string_view.h:5:10: error: 'algorithm' file not found [clang-diagnostic-error]
 >          ^
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:3:11: warning: '__llvm_libc' needs to be the outermost namespace [llvmlibc-implementation-in-namespace]
 > namespace opentracing {
 >           ^
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:11:3: warning: use '= default' to define a trivial default constructor [hicpp-use-equals-default,modernize-use-equals-default]
 >   PropagationErrorCategory() {}
 >   ^                          ~~
 >                              = default;
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:13:15: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
 >   const char* name() const noexcept override {
 >   ~~~~~~~~~~~ ^
 >   auto                              -> const char*
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:13:15: warning: method 'name' can be made static [readability-convert-member-functions-to-static]
 >   const char* name() const noexcept override {
 >               ^      ~~~~~~
 >   static
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:17:24: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
 >   std::error_condition default_error_condition(int code) const
 >                        ^
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:37:15: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
 >   std::string message(int code) const override {
 >               ^
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:58:28: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
 > const std::error_category& propagation_error_category() {
 >                            ^
 > 226 warnings and 1 error generated.
 > Error while processing .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp.
 > Suppressed 218 warnings (218 in non-user code).
 > Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
 > Found compiler error(s).
 > make[3]: *** [CMakeFiles/opentracing.dir/build.make:83: CMakeFiles/opentracing.dir/src/propagation.cpp.o] Error 1
 > make[3]: *** Waiting for unfinished jobs....
 > .../buildroot/output/build/opentracing-cpp-1.5.1/include/opentracing/string_view.h:5:10: error: 'algorithm' file not found [clang-diagnostic-error]
 >          ^
 > .../buildroot/output/build/opentracing-cpp-1.5.1/src/dynamic_load.cpp:4:

 > Disable the 'ENABLE_LINTING' option to avoid this influence.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>


Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
