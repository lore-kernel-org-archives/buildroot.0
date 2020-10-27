From: massimiliano cialdi <massimiliano.cialdi@powersoft.com>
Date: Tue, 27 Oct 2020 15:04:21 +0100
Subject: [Buildroot] problem with cmake on buildroot 2020.02.1
Message-ID: <4b728bde-03fe-d99f-b178-6e492e22bb17@powersoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I try to build on both ubuntu 18.04, 20.04, and 20.10 in all cases cmake 
seems to fail due to a problem on GCC's C++11 support.

/usr/bin/g++ 
-L/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/host/lib 
-Wl,-rpath,/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/host/lib 
-O2 
-I/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/host/include 
-I/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/Bootstrap.cmk 
-I/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/Source 
-I/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/Source/LexerParser 
-I/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/Utilities 
cmAddCustomCommandCommand.o cmAddCustomTargetCommand.o 
cmAddDefinitionsCommand.o cmAddDependenciesCommand.o 
cmAddExecutableCommand.o cmAddLibraryCommand.o 
cmAddSubDirectoryCommand.o cmAddTestCommand.o cmArgumentParser.o 
cmBreakCommand.o cmBuildCommand.o cmCMakeMinimumRequired.o 
cmCMakePolicyCommand.o cmCPackPropertiesGenerator.o cmCacheManager.o 
cmCommand.o cmCommandArgumentParserHelper.o cmCommands.o 
cmCommonTargetGenerator.o cmComputeComponentGraph.o 
cmComputeLinkDepends.o cmComputeLinkInformation.o 
cmComputeTargetDepends.o cmConditionEvaluator.o cmConfigureFileCommand.o 
cmContinueCommand.o cmCoreTryCompile.o cmCreateTestSourceList.o 
cmCustomCommand.o cmCustomCommandGenerator.o cmDefinePropertyCommand.o 
cmDefinitions.o cmDepends.o cmDependsC.o cmDisallowedCommand.o 
cmDocumentationFormatter.o cmEnableLanguageCommand.o 
cmEnableTestingCommand.o cmExecProgramCommand.o 
cmExecuteProcessCommand.o cmExpandedCommandArgument.o 
cmExportBuildFileGenerator.o cmExportFileGenerator.o 
cmExportInstallFileGenerator.o cmExportSet.o cmExportSetMap.o 
cmExportTryCompileFileGenerator.o cmExprParserHelper.o 
cmExternalMakefileProjectGenerator.o cmFileCommand.o cmFileCopier.o 
cmFileInstaller.o cmFileTime.o cmFileTimeCache.o cmFileTimes.o 
cmFindBase.o cmFindCommon.o cmFindFileCommand.o cmFindLibraryCommand.o 
cmFindPackageCommand.o cmFindPathCommand.o cmFindProgramCommand.o 
cmForEachCommand.o cmFunctionCommand.o cmFSPermissions.o 
cmGeneratedFileStream.o cmGeneratorExpression.o 
cmGeneratorExpressionContext.o cmGeneratorExpressionDAGChecker.o 
cmGeneratorExpressionEvaluationFile.o cmGeneratorExpressionEvaluator.o 
cmGeneratorExpressionLexer.o cmGeneratorExpressionNode.o 
cmGeneratorExpressionParser.o cmGeneratorTarget.o 
cmGetCMakePropertyCommand.o cmGetDirectoryPropertyCommand.o 
cmGetFilenameComponentCommand.o cmGetPipes.o cmGetPropertyCommand.o 
cmGetSourceFilePropertyCommand.o cmGetTargetPropertyCommand.o 
cmGetTestPropertyCommand.o cmGlobalCommonGenerator.o cmGlobalGenerator.o 
cmGlobalUnixMakefileGenerator3.o cmGlobVerificationManager.o 
cmHexFileConverter.o cmIfCommand.o cmIncludeCommand.o 
cmIncludeGuardCommand.o cmIncludeDirectoryCommand.o 
cmIncludeRegularExpressionCommand.o cmInstallCommand.o 
cmInstallCommandArguments.o cmInstallDirectoryGenerator.o 
cmInstallExportGenerator.o cmInstallFilesCommand.o 
cmInstallFilesGenerator.o cmInstallGenerator.o 
cmInstallScriptGenerator.o cmInstallSubdirectoryGenerator.o 
cmInstallTargetGenerator.o cmInstallTargetsCommand.o cmInstalledFile.o 
cmLinkDirectoriesCommand.o cmLinkItem.o cmLinkLineComputer.o 
cmLinkLineDeviceComputer.o cmListCommand.o cmListFileCache.o 
cmLocalCommonGenerator.o cmLocalGenerator.o 
cmLocalUnixMakefileGenerator3.o cmMSVC60LinkLineComputer.o 
cmMacroCommand.o cmMakeDirectoryCommand.o cmMakefile.o 
cmMakefileExecutableTargetGenerator.o cmMakefileLibraryTargetGenerator.o 
cmMakefileTargetGenerator.o cmMakefileUtilityTargetGenerator.o 
cmMarkAsAdvancedCommand.o cmMathCommand.o cmMessageCommand.o 
cmMessenger.o cmNewLineStyle.o cmOSXBundleGenerator.o cmOptionCommand.o 
cmOrderDirectories.o cmOutputConverter.o cmParseArgumentsCommand.o 
cmPathLabel.o cmPolicies.o cmProcessOutput.o cmProjectCommand.o 
cmProperty.o cmPropertyDefinition.o cmPropertyDefinitionMap.o 
cmPropertyMap.o cmReturnCommand.o cmRulePlaceholderExpander.o 
cmScriptGenerator.o cmSearchPath.o cmSeparateArgumentsCommand.o 
cmSetCommand.o cmSetDirectoryPropertiesCommand.o cmSetPropertyCommand.o 
cmSetSourceFilesPropertiesCommand.o cmSetTargetPropertiesCommand.o 
cmSetTestsPropertiesCommand.o cmSiteNameCommand.o cmSourceFile.o 
cmSourceFileLocation.o cmState.o cmStateDirectory.o cmStateSnapshot.o 
cmStringReplaceHelper.o cmStringCommand.o cmSubdirCommand.o 
cmSystemTools.o cmTarget.o cmTargetCompileDefinitionsCommand.o 
cmTargetCompileFeaturesCommand.o cmTargetCompileOptionsCommand.o 
cmTargetIncludeDirectoriesCommand.o cmTargetLinkLibrariesCommand.o 
cmTargetPropCommandBase.o cmTargetPropertyComputer.o 
cmTargetSourcesCommand.o cmTest.o cmTestGenerator.o cmTimestamp.o 
cmTryCompileCommand.o cmTryRunCommand.o cmUnexpectedCommand.o 
cmUnsetCommand.o cmUVHandlePtr.o cmUVProcessChain.o cmVersion.o 
cmWhileCommand.o cmWorkingDirectory.o cmake.o cmakemain.o cmcmd.o 
cm_string_view.o cmCommandArgumentLexer.o cmCommandArgumentParser.o 
cmExprLexer.o cmExprParser.o cmListFileLexer.o Directory.o EncodingCXX.o 
FStream.o Glob.o RegularExpression.o SystemTools.o EncodingC.o 
ProcessUNIX.o String.o System.o Terminal.o uv-src-strscpy.c.o 
uv-src-timer.c.o uv-src-uv-common.c.o uv-src-unix-cmake-bootstrap.c.o 
uv-src-unix-core.c.o uv-src-unix-fs.c.o uv-src-unix-loop.c.o 
uv-src-unix-loop-watcher.c.o uv-src-unix-no-fsevents.c.o 
uv-src-unix-pipe.c.o uv-src-unix-poll.c.o uv-src-unix-posix-hrtime.c.o 
uv-src-unix-posix-poll.c.o uv-src-unix-process.c.o 
uv-src-unix-signal.c.o uv-src-unix-stream.c.o? -ldl -lrt -o cmake
loading initial cache file 
/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/Bootstrap.cmk/InitialCacheFlags.cmake
-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Check for working C compiler: /usr/bin/gcc
-- Check for working C compiler: /usr/bin/gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/g++
-- Check for working CXX compiler: /usr/bin/g++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Checking if compiler supports C11 _Thread_local
-- Checking if compiler supports C11 _Thread_local - yes
-- Checking if compiler supports needed C++17 constructs
-- Checking if compiler supports needed C++17 constructs - yes
-- Checking if compiler supports C++ make_unique
-- Checking if compiler supports C++ make_unique - no
-- Checking if compiler supports C++ unique_ptr
-- Checking if compiler supports C++ unique_ptr - no
CMake Error at CMakeLists.txt:92 (message):
 ? The C++ compiler does not support C++11 (e.g. std::unique_ptr).


-- Configuring incomplete, errors occurred!
See also 
"/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/CMakeFiles/CMakeOutput.log".
See also 
"/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/CMakeFiles/CMakeError.log".
---------------------------------------------
Error when bootstrapping CMake:
Problem while running initial CMake
---------------------------------------------
make[1]: *** [package/pkg-generic.mk:259: 
/home/max/Lavori/nova/DEP/buildroot-output/buildroot-2020.02.1/output/build/host-cmake-3.15.5/.stamp_configured] 
Error 11


I attach the .config file, the construction trace and the files 
CMakeOutput.log andCMakeError.log.

best regards

Max

-- 
Firma
Massimiliano Cialdi
SENIOR FIRMWARE ENGINEER

Powersoft S.p.A
Via E. Conti, 5 - Scandicci (Fi) 50018 - Italy
OFFICE: 	+39 ?055 01 53 429
SKYPE: 	mci.pws

Website <http://www.powersoft-audio.com/en/> 	Facebook 
<https://www.facebook.com/powersoft> 	Twitter 
<https://twitter.com/powersoft_audio> 	Linkedin 
<https://www.linkedin.com/company/powersoft> 	Youtube 
<https://www.youtube.com/user/powersoftaudio> 	Instagram 
<https://www.instagram.com/powersoft.audio/>


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201027/807657ae/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cmake.tar.bz2
Type: application/x-bzip
Size: 227970 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201027/807657ae/attachment-0001.bz>
