From: Ajorian <arastoo.ajorian@gmail.com>
Date: Sat, 26 Nov 2016 00:07:56 -0800 (PST)
Subject: [Buildroot] problem with cups
Message-ID: <1480147676790-151149.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello every body. Im newbie with buildroot. I created an embedded system
using buildroot. i added cups, cups-filters and hplip to the project and
configured cups using /etc/cups/cupsd.conf file. then i added my hp1102
printer using web interface.
now my problem is that i get "filter error" and no thing happen for printer
(no action). i checked /var/log/cups/error_log and got bellow messages:

E [02/Jan/2000:23:03:37 +0000] Unable to open listen socket for address
[v1.::]:631 - Address family not supported by protocol.
W [02/Jan/2000:23:04:45 +0000] CreateProfile failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [02/Jan/2000:23:04:45 +0000] CreateDevice failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [02/Jan/2000:23:04:54 +0000] CreateProfile failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
W [02/Jan/2000:23:04:54 +0000] CreateDevice failed:
org.freedesktop.DBus.Error.ServiceUnknown:The name
org.freedesktop.ColorManager was not provided by any .service files
E [02/Jan/2000:23:04:59 +0000] [Job 1] Job stopped due to filter errors;
please consult the error_log file for details.
D [02/Jan/2000:23:04:59 +0000] [Job 1] The following messages were recorded
from 23:04:58 to 23:04:59
D [02/Jan/2000:23:04:59 +0000] [Job 1] Adding start banner page "none".
D [02/Jan/2000:23:04:59 +0000] [Job 1] Adding end banner page "none".
D [02/Jan/2000:23:04:59 +0000] [Job 1] File of type
application/vnd.cups-pdf-banner queued by "root".
D [02/Jan/2000:23:04:59 +0000] [Job 1] hold_until=0
D [02/Jan/2000:23:04:59 +0000] [Job 1] Queued on "dfddfdfd" by "root".
D [02/Jan/2000:23:04:59 +0000] [Job 1] time-at-processing=946854298
D [02/Jan/2000:23:04:59 +0000] [Job 1] 4 filters for job:
D [02/Jan/2000:23:04:59 +0000] [Job 1] bannertopdf
(application/vnd.cups-pdf-banner to application/pdf, cost 32)
D [02/Jan/2000:23:04:59 +0000] [Job 1] pdftopdf (application/pdf to
application/vnd.cups-pdf, cost 66)
D [02/Jan/2000:23:04:59 +0000] [Job 1] pdftops (application/vnd.cups-pdf to
application/vnd.cups-postscript, cost 100)
D [02/Jan/2000:23:04:59 +0000] [Job 1] foomatic-rip
(application/vnd.cups-postscript to printer/dfddfdfd, cost 0)
D [02/Jan/2000:23:04:59 +0000] [Job 1] job-sheets=none,none
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[0]="dfddfdfd"
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[1]="1"
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[2]="root"
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[3]="Test Page"
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[4]="1"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
argv[5]="job-uuid=urn:uuid:26b57b21-d528-3b88-614f-ebdd9980975d
job-originating-host-name=localhost date-time-at-creation=
date-time-at-processing= time-at-creation=946854298
time-at-processing=946854298"
D [02/Jan/2000:23:04:59 +0000] [Job 1] argv[6]="/var/spool/cups/d00001-001"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[0]="CUPS_CACHEDIR=/var/cache/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[1]="CUPS_DATADIR=/usr/share/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[2]="CUPS_DOCROOT=/usr/share/doc/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[3]="CUPS_FONTPATH=/usr/share/cups/fonts"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[4]="CUPS_REQUESTROOT=/var/spool/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[5]="CUPS_SERVERBIN=/usr/lib/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[6]="CUPS_SERVERROOT=/etc/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[7]="CUPS_STATEDIR=/var/run/cups"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[8]="HOME=/var/spool/cups/tmp"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[9]="PATH=/usr/lib/cups/filter:/usr/bin:/usr/sbin:/bin:/usr/bin"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[10]="SERVER_ADMIN=root at Ma"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[11]="SOFTWARE=CUPS/2.1.4"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[12]="TMPDIR=/var/spool/cups/tmp"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[13]="USER=root"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[14]="CUPS_MAX_MESSAGE=2047"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[15]="CUPS_SERVER=/var/run/cups/cups.sock"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[16]="CUPS_ENCRYPTION=IfRequested"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[17]="IPP_PORT=631"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[18]="CHARSET=utf-8"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[19]="LANG=en_US.UTF-8"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[20]="PPD=/etc/cups/ppd/dfddfdfd.ppd"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[21]="RIP_MAX_CACHE=128m"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[22]="CONTENT_TYPE=application/vnd.cups-pdf-banner"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[23]="DEVICE_URI=hp:/usb/HP_LaserJet_Professional_P1102?serial=000000000Q892BHSPR1a"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[24]="PRINTER_INFO="
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[25]="PRINTER_LOCATION="
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[26]="PRINTER=dfddfdfd"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[27]="PRINTER_STATE_REASONS=none"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[28]="CUPS_FILETYPE=document"
D [02/Jan/2000:23:04:59 +0000] [Job 1]
envp[29]="FINAL_CONTENT_TYPE=application/vnd.cups-postscript"
D [02/Jan/2000:23:04:59 +0000] [Job 1] envp[30]="AUTH_I****"
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter
/usr/lib/cups/filter/bannertopdf (PID 191)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter
/usr/lib/cups/filter/pdftopdf (PID 192)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter
/usr/lib/cups/filter/pdftops (PID 193)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter
/usr/lib/cups/filter/foomatic-rip (PID 194)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started backend
/usr/lib/cups/backend/hp (PID 195)
D [02/Jan/2000:23:04:59 +0000] [Job 1] \'CM Color Calibration\' Mode in
SPOOLER-LESS: Off
D [02/Jan/2000:23:04:59 +0000] [Job 1] Getting input from file 
D [02/Jan/2000:23:04:59 +0000] [Job 1] foomatic-rip version 1.0.67
running...
D [02/Jan/2000:23:04:59 +0000] [Job 1] Parsing PPD file ...
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option ColorSpace
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option PageSize
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option Quality
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option Resolution
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option ImageableArea
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option PaperDimension
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option InputSlot
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option MediaType
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option Density
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option Copies
D [02/Jan/2000:23:04:59 +0000] [Job 1] pdftops - copying to temp print file
\"/var/spool/cups/tmp/000c13879b775\"
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option halftone
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option NupOrient
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option NupPages
D [02/Jan/2000:23:04:59 +0000] [Job 1] Added option Font
D [02/Jan/2000:23:04:59 +0000] [Job 1] Parameter Summary
D [02/Jan/2000:23:04:59 +0000] [Job 1] -----------------
D [02/Jan/2000:23:04:59 +0000] [Job 1] Spooler: cups
D [02/Jan/2000:23:04:59 +0000] [Job 1] Printer: dfddfdfd
D [02/Jan/2000:23:04:59 +0000] [Job 1] Shell: /bin/bash
D [02/Jan/2000:23:04:59 +0000] [Job 1] PPD file: /etc/cups/ppd/dfddfdfd.ppd
D [02/Jan/2000:23:04:59 +0000] [Job 1] ATTR file: 
D [02/Jan/2000:23:04:59 +0000] [Job 1] Printer model: HP LaserJet Pro P1102
Foomatic/foo2zjs-z2 (recommended)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Job title: Test Page
D [02/Jan/2000:23:04:59 +0000] [Job 1] File(s) to be printed:
D [02/Jan/2000:23:04:59 +0000] [Job 1] <STDIN>
D [02/Jan/2000:23:04:59 +0000] [Job 1] Ghostscript extra search path
(\'GS_LIB\'): /usr/share/cups/fonts
D [02/Jan/2000:23:04:59 +0000] [Job 1] Printing system options:
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'job-uuid=urn:uuid:26b57b21-d528-3b88-614f-ebdd9980975d\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
job-uuid=urn:uuid:26b57b21-d528-3b88-614f-ebdd9980975d.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'job-originating-host-name=localhost\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
job-originating-host-name=localhost.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'date-time-at-creation=\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
date-time-at-creation=.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'date-time-at-processing=\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
date-time-at-processing=.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'time-at-creation=946854298\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
time-at-creation=946854298.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Pondering option
\'time-at-processing=946854298\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unknown option
time-at-processing=946854298.
D [02/Jan/2000:23:04:59 +0000] [Job 1] CM Color Calibration Mode in CUPS:
Off
D [02/Jan/2000:23:04:59 +0000] [Job 1] Options from the PPD file:
D [02/Jan/2000:23:04:59 +0000] [Job 1]
================================================
D [02/Jan/2000:23:04:59 +0000] [Job 1] File: <STDIN>
D [02/Jan/2000:23:04:59 +0000] [Job 1]
================================================
D [02/Jan/2000:23:04:59 +0000] [Job 1] PDF template file doesn\'t have form.
It\'s okay.
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 191
(/usr/lib/cups/filter/bannertopdf) exited with no errors.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Printer make and model: HP HP
LaserJet Professional P1102
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 192
(/usr/lib/cups/filter/pdftopdf) exited with no errors.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Running command line for pstops:
pstops 1 root \'Test Page\' 1
\'job-uuid=urn:uuid:26b57b21-d528-3b88-614f-ebdd9980975d
job-originating-host-name=localhost date-time-at-creation=
date-time-at-processing= time-at-creation=946854298
time-at-processing=946854298\'
D [02/Jan/2000:23:04:59 +0000] [Job 1] No resolution information found in
the PPD file.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Using image rendering resolution 300
dpi
D [02/Jan/2000:23:04:59 +0000] [Job 1] Running command line for gs: gs -q
-dNOPAUSE -dBATCH -dSAFER -sDEVICE=ps2write -sOUTPUTFILE=%stdout
-dLanguageLevel=3 -r300 -dCompressFonts=false -dNoT3CCITT -dNOINTERPOLATE -c
\'save pop\' -f /var/spool/cups/tmp/000c13879b775
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter gs (PID 196)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter pstops (PID 197)
D [02/Jan/2000:23:04:59 +0000] [Job 1] Unable to execute gs program: No such
file or directory
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 196 (gs) stopped with status 1!
D [02/Jan/2000:23:04:59 +0000] [Job 1] The print file is empty.
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 197 (pstops) stopped with status
1!
D [02/Jan/2000:23:04:59 +0000] [Job 1] Cannot process \"<STDIN>\": Unknown
filetype.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Process is dying with \"Could not
print file <STDIN>
D [02/Jan/2000:23:04:59 +0000] [Job 1] \", exit stat 2
D [02/Jan/2000:23:04:59 +0000] [Job 1] Cleaning up...
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 193
(/usr/lib/cups/filter/pdftops) stopped with status 1.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Hint: Try setting the LogLevel to
"debug" to find out more.
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 194
(/usr/lib/cups/filter/foomatic-rip) stopped with status 2.
D [02/Jan/2000:23:04:59 +0000] [Job 1] Hint: Try setting the LogLevel to
"debug" to find out more.
D [02/Jan/2000:23:04:59 +0000] [Job 1] prnt/backend/hp.c 919: ERROR: null
print job total=0
D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 195 (/usr/lib/cups/backend/hp)
exited with no errors.
D [02/Jan/2000:23:04:59 +0000] [Job 1] End of messages
D [02/Jan/2000:23:04:59 +0000] [Job 1] printer-state=3(idle)
D [02/Jan/2000:23:04:59 +0000] [Job 1] printer-state-message="Filter failed"
D [02/Jan/2000:23:04:59 +0000] [Job 1] printer-state-reasons=none


anybody can help me?



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/problem-with-cups-tp151149.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
