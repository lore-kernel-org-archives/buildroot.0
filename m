From: John L. Conway IV <john@johnconwayiv.com>
Date: Mon, 14 Dec 2009 16:05:01 -0500
Subject: [Buildroot] Compiling with Xerces - wchar compilation errors
Message-ID: <cb79a1860912141305h6de46a91q5f8965779bea86d8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to compile with xerces enabled for the Grasshopper AVR32 AP7000
Board and the compilation fails with wchar.h and wctype.h not found. I have
been searching the net for a while and have found that this has been an
issue before, but I could not find a fix. I have enabled WCHAR support in
the main menuconfig as well as in the uclibc menuconfig. I am currently
using the modified buildroot for the Grasshopper board, version 2.3.0.

Is there a patch I need or am I missing a configuration step somewhere.

Thanks,
John Conway

Compiler Output:
  (C++) IconvTransService.o
IconvTransService.cpp:29:19: error: wchar.h: No such file or directory
IconvTransService.cpp:43:28: error: wctype.h: No such file or directory
IconvTransService.cpp: In member function 'virtual int
xercesc_2_7::IconvTransService::compareIString(const XMLCh*, const XMLCh*)':
IconvTransService.cpp:102: error: 'wint_t' was not declared in this scope
IconvTransService.cpp:102: error: expected `;' before 'wch1'
IconvTransService.cpp:103: error: expected `;' before 'wch2'
IconvTransService.cpp:104: error: 'wch1' was not declared in this scope
IconvTransService.cpp:104: error: 'wch2' was not declared in this scope
IconvTransService.cpp:110: error: 'towupper' was not declared in this scope
IconvTransService.cpp: In member function 'virtual int
xercesc_2_7::IconvTransService::compareNIString(const XMLCh*, const XMLCh*,
unsigned int)':
IconvTransService.cpp:124: error: 'wint_t' was not declared in this scope
IconvTransService.cpp:124: error: expected `;' before 'wch1'
IconvTransService.cpp:125: error: expected `;' before 'wch2'
IconvTransService.cpp:127: error: 'wch1' was not declared in this scope
IconvTransService.cpp:127: error: 'wch2' was not declared in this scope
IconvTransService.cpp: In member function 'virtual bool
xercesc_2_7::IconvTransService::isSpace(XMLCh) const':
IconvTransService.cpp:157: error: 'iswspace' was not declared in this scope
IconvTransService.cpp: In member function 'virtual void
xercesc_2_7::IconvTransService::upperCase(XMLCh*) const':
IconvTransService.cpp:199: error: 'towupper' was not declared in this scope
IconvTransService.cpp: In member function 'virtual void
xercesc_2_7::IconvTransService::lowerCase(XMLCh*) const':
IconvTransService.cpp:209: error: 'towlower' was not declared in this scope
IconvTransService.cpp: In member function 'virtual unsigned int
xercesc_2_7::IconvLCPTranscoder::calcRequiredSize(const char*,
xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:228: error: '::mblen' has not been declared
IconvTransService.cpp:228: error: 'MB_CUR_MAX' was not declared in this
scope
IconvTransService.cpp: In member function 'virtual unsigned int
xercesc_2_7::IconvLCPTranscoder::calcRequiredSize(const XMLCh*,
xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:263: error: '::wcstombs' has not been declared
IconvTransService.cpp: In member function 'virtual char*
xercesc_2_7::IconvLCPTranscoder::transcode(const XMLCh*)':
IconvTransService.cpp:298: error: '::wcstombs' has not been declared
IconvTransService.cpp:308: error: '::wcstombs' has not been declared
IconvTransService.cpp: In member function 'virtual char*
xercesc_2_7::IconvLCPTranscoder::transcode(const XMLCh*,
xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:350: error: '::wcstombs' has not been declared
IconvTransService.cpp:360: error: '::wcstombs' has not been declared
IconvTransService.cpp: In member function 'virtual bool
xercesc_2_7::IconvLCPTranscoder::transcode(const XMLCh*, char*, unsigned
int, xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:417: error: '::wcstombs' has not been declared
IconvTransService.cpp: In member function 'virtual XMLCh*
xercesc_2_7::IconvLCPTranscoder::transcode(const char*)':
IconvTransService.cpp:457: error: '::mbstowcs' has not been declared
IconvTransService.cpp: In member function 'virtual XMLCh*
xercesc_2_7::IconvLCPTranscoder::transcode(const char*,
xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:503: error: '::mbstowcs' has not been declared
IconvTransService.cpp: In member function 'virtual bool
xercesc_2_7::IconvLCPTranscoder::transcode(const char*, XMLCh*, unsigned
int, xercesc_2_7::MemoryManager*)':
IconvTransService.cpp:556: error: '::mbstowcs' has not been declared
make[3]: *** [IconvTransService.o] Error 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091214/3d26278d/attachment.htm>
