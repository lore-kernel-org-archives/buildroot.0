From: Eial Czerwacki <eial@scalemp.com>
Date: Sun, 17 Jan 2016 17:42:58 +0200
Subject: [Buildroot] could not read symbols: Bad value error on musl based
 buildroot env on rpi2 config.
Message-ID: <569BB682.4000707@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm trying to create a musl base env for my rpi2 and I'm getting the
below failure.

/usr/bin/ld: /usr/local/lib/libpython2.7.a(abstract.o): relocation
R_X86_64_32 against `.rodata.str1.8' can not be used when making a
shared object; recompile with -fPIC
/usr/local/lib/libpython2.7.a: could not read symbols: Bad value
collect2: ld returned 1 exit status

Python build finished, but the necessary bits to build these modules
were not found:
_tkinter           bsddb185           dl             
imageop            sunaudiodev                       
To find the necessary bits, look in setup.py in detect_modules() for the
module's name.


Failed to build these modules:
_bisect            _codecs_iso2022    _collections   
_csv               _ctypes            _ctypes_test   
_elementtree       _functools         _hashlib       
_heapq             _hotshot           _io            
_json              _locale            _lsprof        
_multibytecodec    _multiprocessing   _random        
_socket            _ssl               _struct        
_testcapi          array              audioop        
binascii           cmath              cPickle        
crypt              cStringIO          datetime       
fcntl              future_builtins    grp            
itertools          linuxaudiodev      math           
mmap               operator           parser         
pyexpat            readline           resource       
select             spwd               strop          
syslog             termios            time           
unicodedata        zlib                              

make[1]: *** [sharedmods] Error 1

my config can be found here: http://paste.ubuntu.com/14543009/

is it possible I'm having a bitness issue on the system? the machine I'm
using to compile is 64 bit but the machine on which the fs exists is 32 bit.
any ideas how to fix it?

Thanks.
